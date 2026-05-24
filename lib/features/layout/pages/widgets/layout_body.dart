import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/pages/views/cart_view.dart';
import '../../../home/presentation/pages/views/home_view.dart';
import '../../../settings/presentation/pages/views/settings_view.dart';
import '../../../favourites/presentation/pages/views/favourites_view.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) => PageView(
        controller: LayoutCubit.get(context).pageController,
        onPageChanged: (index) => LayoutCubit.get(context).onPageChanged(index),
        children: [
          const HomeView(),
          const FavouritesView(),
          const CartView(),
          const SettingsView(),
        ],
      ),
    );
  }
}