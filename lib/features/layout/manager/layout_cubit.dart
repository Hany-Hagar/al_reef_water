import 'layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  // ignore: strict_top_level_inference
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 0;
  var pageController = PageController();
  void changeBottomNav(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(LayoutChangeBottomNavState());
  }

  /// Called when user swipes pages
  void onPageChanged(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
