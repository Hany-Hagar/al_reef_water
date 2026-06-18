// ignore_for_file: unused_element_parameter

import 'dart:developer';

import '../../generated/l10n.dart';
import 'custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatelessWidget {
  final bool shrinkWrap;
  final List items;
  final bool isLoading;
  final double? animationTopPadding;
  final String? emptyAnimation;
  final String? emptyMessage;
  final bool isFailure;
  final String? failureAnimation;
  final String? failureMessage;
  final List emptyItems;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  const CustomList({
    super.key,
     this.shrinkWrap = false,
    required this.isLoading,
    required this.isFailure,
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    this.scrollDirection,
    this.emptyItems = const [],
    this.animationTopPadding,
    this.emptyAnimation,
    this.emptyMessage,
    this.failureAnimation,
    this.failureMessage,

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
      child: _List(
        shrinkWrap: shrinkWrap,
        items: isLoading ? emptyItems : items,
        physics: physics,
        padding: padding,
        itemBuilder: itemBuilder,
        scrollDirection: scrollDirection,
        animationTopPadding: animationTopPadding,
        emptyAnimation: emptyAnimation,
        emptyMessage: emptyMessage,      
      ),
    );
  }
}


class _List extends StatelessWidget {
  final bool shrinkWrap;
  final List items;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Axis? scrollDirection;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final double? animationTopPadding;
  final String? emptyAnimation;
  final String? emptyMessage;
  const _List({
    required this.shrinkWrap,
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    this.scrollDirection,
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
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length,
      scrollDirection: scrollDirection ?? Axis.vertical,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
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
    log("Failure: $failureMessage");
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
            maxLines: 10,
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
