// ignore_for_file: unused_element_parameter

import 'home_product_item.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import '../../../../../core/widgets/custom_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeProducts extends StatelessWidget {
  final bool isLoading;
  final bool isFailure;
  final List<ProductModel> products;
  const HomeProducts({
    super.key,
    required this.isLoading,
    required this.isFailure,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return _List(
      shrinkWrap: true,
      crossAxisCount: 2,
      products: products,
      isFailure: isFailure,
      isLoading: isLoading,
      childAspectRatio: 0.9,
      scrollDirection: Axis.vertical,
    );
  }
}

class _List extends StatelessWidget {
  final bool isLoading;
  final bool isFailure;
  final bool? shrinkWrap;
  final int? crossAxisCount;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final double? childAspectRatio;
  final List<ProductModel> products;
  const _List({
    required this.isLoading,
    required this.isFailure,
    this.shrinkWrap,
    this.crossAxisCount,
    this.scrollDirection,
    this.physics,
    this.childAspectRatio,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGrid(
      items: products,
      physics: physics,
      shrinkWrap: shrinkWrap,
      isLoading: isLoading,
      isFailure: isFailure,
      crossAxisCount: crossAxisCount ?? 1,
      childAspectRatio: childAspectRatio ?? 1.2,
      scrollDirection: scrollDirection ?? Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      emptyItems: List.generate(4, (index) => ProductModel.empty()),
      itemBuilder: (context, item) =>
          HomeProductItem(product: item as ProductModel),
    );
  }
}
