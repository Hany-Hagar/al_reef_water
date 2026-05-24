import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGrid extends StatelessWidget {
  final List items;
  final bool isLoading;
  final bool isFailure;
  final List emptyItems;
  final String? errorMessage;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

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
    this.childAspectRatio =0.89 ,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    if (isFailure) {
      return _Failure(errorMessage: errorMessage ?? "An error occurred");
    }
    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: true,
      child: _Grid(
        items: isLoading ? emptyItems : items,
        physics: physics,
        padding: padding,
        itemBuilder: itemBuilder,
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
    );
  }
}

class _Grid extends StatelessWidget {
  final List items;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const _Grid({
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _Empty();
    }
    return GridView.builder(
      physics: physics,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
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
