
import '../widgets/layout_body.dart';
import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../manager/layout_states.dart';
import '../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/icon_broken.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/services/snack_bar_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../favourites/presentation/manager/fav_cubit.dart';
import '../../../favourites/presentation/manager/fav_states.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavCubit, FavState>(
      listener: (context, state) {
        if (state is FavFailure) {
          SnackBarService.failure(context: context, message: state.message);
        }
      },
      child: CustomBackground(
        body: LayoutBody(),
        bottom: _BottomNavigationBar(),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) => BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: LayoutCubit.get(context).currentIndex,
        onTap: (index) => LayoutCubit.get(context).changeBottomNav(index),
        selectedLabelStyle: Styles.textStyle700.copyWith(
          fontSize: 12.sp,
          color: Theme.of(context).hintColor,
        ),
        unselectedLabelStyle: Styles.textStyle700.copyWith(fontSize: 12.sp),
        items: [
          _item(label: s.home, icon: IconBroken.Home),
          _item(label: s.favourites, icon: IconBroken.Heart),
          _item(label: s.cart, icon: IconBroken.Buy),
          _item(label: s.profile, icon: IconBroken.Profile),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _item({required String label, required IconData icon}) {
  return BottomNavigationBarItem(label: label, icon: Icon(icon));
}
