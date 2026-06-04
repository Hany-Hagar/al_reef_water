// ignore_for_file: unused_element_parameter

import 'home_product_item.dart';
import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../manager/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeProducts extends StatelessWidget {
  final String title;
  final bool isVertical;
  const HomeProducts({
    super.key,
    required this.title,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var products = ProductCubit.get(context).products;
        return isVertical
            ? _Vertical(
                title: title,
                products: products,
                isLoading: state is ProductLoading,
                isFailure: state is ProductFailure,
              )
            : _Horizontal(
                title: title,
                products: products,
                isLoading: state is ProductLoading,
                isFailure: state is ProductFailure,
              );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: CustomText(text: title, size: 18.sp, type: Type.header),
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
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 0),
      emptyItems: List.generate(4, (index) => ProductModel.empty()),
      itemBuilder: (context, item) =>
          HomeProductItem(product: item as ProductModel),
    );
  }
}

class _Horizontal extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isFailure;
  final List<ProductModel> products;
  const _Horizontal({
    required this.title,
    required this.isLoading,
    required this.isFailure,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _Title(title: title),
        SizedBox(height: 12.h),
        SizedBox(
          height: 200.h,
          child: _List(
            products: products,
            isFailure: isFailure,
            isLoading: isLoading,
            crossAxisCount: 1,
            childAspectRatio: 1.2,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class _Vertical extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isFailure;
  final List<ProductModel> products;
  const _Vertical({
    required this.title,
    required this.isLoading,
    required this.isFailure,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _Title(title: title),
        SizedBox(height: 12.h),
        _List(
          shrinkWrap: true,
          crossAxisCount: 2,
          products: products,
          isFailure: isFailure,
          isLoading: isLoading,
          childAspectRatio: 0.9,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
