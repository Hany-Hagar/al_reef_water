// ignore_for_file: unused_element_parameter

import '../../generated/l10n.dart';
import 'custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGrid extends StatelessWidget {
  final List items;
  final bool? shrinkWrap;
  final double? animationTopPadding;
  final bool isLoading;
  final String? emptyAnimation;
  final String? emptyMessage;
  final bool isFailure;
  final String? failureAnimation;
  final String? failureMessage;
  final List emptyItems;
  final int crossAxisCount;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;

  const CustomGrid({
    super.key,
    required this.isLoading,
    this.animationTopPadding,
    this.emptyAnimation,
    this.emptyMessage,
    required this.isFailure,
    this.failureAnimation,
    this.failureMessage,
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    this.emptyItems = const [],
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.89,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
    this.scrollDirection,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    if (isFailure) {
      return _Failure(
        animationTopPadding: animationTopPadding,
        failureAnimation: failureAnimation,
        failureMessage: failureMessage,
      );
    }
    return Skeletonizer(
      enabled: isLoading,
      child: _Grid(
        shrinkWrap: shrinkWrap,
        physics: physics,
        padding: padding,
        itemBuilder: itemBuilder,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        scrollDirection: scrollDirection,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        items: isLoading ? emptyItems : items,
        animationTopPadding: animationTopPadding,
        emptyAnimation: emptyAnimation,
        emptyMessage: emptyMessage,
      ),
    );
  }
}

class _Grid extends StatelessWidget {
  final List items;
  final bool? shrinkWrap;
  final int crossAxisCount;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final double? animationTopPadding;
  final String? emptyAnimation;
  final String? emptyMessage;

  const _Grid({
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    this.scrollDirection,
    this.shrinkWrap,
    this.animationTopPadding,
    this.emptyAnimation,
    this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _Empty(
        animationTopPadding: animationTopPadding,
        emptyAnimation: emptyAnimation,
        emptyMessage: emptyMessage,
      );
    }
    return GridView.builder(
      physics: physics,
      shrinkWrap: shrinkWrap ?? false,
      itemCount: items.length,
      scrollDirection: scrollDirection ?? Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
      ),
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    );
  }
}

class _Failure extends StatelessWidget {
  final double? animationTopPadding;
  final String? failureAnimation;
  final String? failureMessage;
  const _Failure({
    this.animationTopPadding,
    this.failureAnimation,
    this.failureMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: animationTopPadding ?? 16.w,
        start: 16.w,
        end: 16.w,
        bottom: 16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            failureAnimation ?? "assets/lotties/failure.json",
            width:double.infinity,
            height: 200.h,
          ),
          const SizedBox(height: 16),
          CustomText(
            text: failureMessage ?? "Something went wrong",
            size: 16.sp,
            type: Type.overMedium,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  final double? animationTopPadding;
  final String? emptyAnimation;
  final String? emptyMessage;
  const _Empty({
    this.emptyAnimation,
    this.emptyMessage,
    this.animationTopPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: animationTopPadding ?? 16.w,
        start: 16.w,
        end: 16.w,
        bottom: 16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            emptyAnimation ?? "assets/lotties/emptyProducts.json",
            width:double.infinity,
            height: 200.h,
          ),
          const SizedBox(height: 16),
          CustomText(
            text: emptyMessage ?? S.of(context).noProductsFound,
            size: 16.sp,
            type: Type.overMedium,
          ),
        ],
      ),
    );
  }
}
