// ignore_for_file: unused_element_parameter

import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGrid extends StatelessWidget {
  final List items;
  final bool? shrinkWrap;
  final bool isLoading;
  final bool isFailure;
  final List emptyItems;
  final int crossAxisCount;
  final String? errorMessage;
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
    required this.isFailure,
    this.errorMessage,
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
      return _Failure(errorMessage: errorMessage ?? "An error occurred");
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
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _Empty();
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
  final String errorMessage;
  const _Failure({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 80, color: Colors.red),
        const SizedBox(height: 16),
        CustomText(
          text: errorMessage,
          size: 16.sp,
          type: Type.overMedium,
          color: Colors.red,
        ),
      ],
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.inbox, size: 80),
        const SizedBox(height: 16),
        CustomText(text: "No items found", size: 16.sp, type: Type.overMedium),
      ],
    );
  }
}
