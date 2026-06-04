
import '../widgets/home_body.dart';
import '../widgets/home_banners.dart';
import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/profile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../cart/presentation/manager/cart_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider.value(
        value: getIt<ProductCubit>()..fetchProducts(),
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              SnackBarService.success(
                context: context,
                message: S.of(context).addProductToCartSuccess,
              );
            }
          },
          child: CustomBackground(top: const _Top(), body: const HomeBody()),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var userName = getIt<AuthCubit>().user?.firstName;
    return Column(
      children: [
        ListTile(
          contentPadding: defaultHomeAppBarPadding(context),
          title: CustomText(text: s.hi, size: 18.sp, type: Type.header),
          subtitle: CustomText(
            text: "${s.welcomeBack} $userName🌟",
            size: 16.sp,
            type: Type.header,
          ),
          trailing: ProfileWidget(),
        ),
        const HomeBanners(),
        SizedBox(height: 10.h),
        _TabView(),
      ],
    );
  }
}

class _TabView extends StatelessWidget {
  const _TabView();

  @override
  Widget build(BuildContext context) {
    var fontColor = Theme.of(context).hintColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TabBar(
        isScrollable: false,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelStyle: Styles.textStyle800.copyWith(
          color: fontColor,
          fontSize: 16.sp,
        ),
        unselectedLabelStyle: Styles.textStyle700.copyWith(
          color: fontColor.withValues(alpha: 0.8),
          fontSize: 13.sp,
        ),
        tabs: const [
          Tab(text: "عروض اليوم"),
          Tab(text: 'عروض المساجد'),
          Tab(text: 'عروض الشركات'),
        ],
      ),
    );
  }
}

