
import 'custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatelessWidget {
  final List items;
  final bool isLoading;
  final bool isFailure;
  final List emptyItems;
  final String? errorMessage;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final String? emptyAnimation;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  const CustomList({
    super.key,
    required this.isLoading,
    required this.isFailure,
    this.errorMessage,
    required this.items,
    this.physics,
    this.padding,
    required this.itemBuilder,
    this.emptyAnimation,
    this.emptyItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (isFailure) {
      return _Failure(errorMessage: errorMessage ?? "An error occurred");
    }
    return Skeletonizer(
      enabled: isLoading,
      child: _List(
        items: isLoading ? emptyItems : items,
        physics: physics,
        padding: padding,
        itemBuilder: itemBuilder,
        emptyAnimation: emptyAnimation,
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  final String errorMessage;
  const _Failure({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          CustomText(
            text: errorMessage,
            size: 16.sp,
            type: Type.overMedium,
            color: Colors.red,
            maxLines: 10,
          ),
        ],
      )
    );
  }
}

class _Empty extends StatelessWidget {
  final String? emptyAnimation;
  const _Empty({this.emptyAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (emptyAnimation != null) Lottie.asset(emptyAnimation!, width: MediaQuery.sizeOf(context).width * 0.5),
        if (emptyAnimation == null) const Icon(Icons.inbox, size: 80), 
         SizedBox(height: 16 , width: double.infinity,),
        CustomText(text: "No items found", size: 16.sp, type: Type.overMedium),
      ],
    );
  }
}

class _List extends StatelessWidget {
  final List items;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final String? emptyAnimation;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  const _List({
    required this.items,
    this.physics,
    this.padding,
    this.emptyAnimation,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return  _Empty(emptyAnimation: emptyAnimation,);
    }
    return ListView.separated(
      physics: physics,
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    );
  }
}
