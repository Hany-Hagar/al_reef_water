import '../../../../../core/services/snack_bar_service.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../../../cart/presentation/manager/cart_states.dart';
import '../widgets/home_body.dart';
import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../../core/widgets/custom_profile_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductCubit>()
        ..fetchProducts()
        ..fetchProducts(),
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
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var userName = getIt<AuthCubit>().user?.firstName;
    return ListTile(
      contentPadding: defaultAppBarPadding(context),
      title: CustomText(text: s.hi, size: 18.sp, type: Type.header),
      subtitle: CustomText(
        text: "${s.welcomeBack} $userName🌟",
        size: 16.sp,
        type: Type.header,
      ),
      trailing: CustomProfileWidget(radius: 20),
    );
  }
}
