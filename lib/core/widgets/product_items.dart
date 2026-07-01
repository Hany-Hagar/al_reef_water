// ignore_for_file: unused_element_parameter

import 'package:al_reef_app/core/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'custom_grid.dart';
import 'package:flutter/material.dart';
import '../services/dialog_service.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/cart/presentation/manager/cart_cubit.dart';
import '../../features/cart/presentation/manager/cart_states.dart';
import '../../features/home/presentation/pages/widgets/favourite_icon.dart';

class ProductItems extends StatelessWidget {
  final bool isLoading;
  final bool isFailure;
  final List<ProductModel> products;
  final double? animationTopPadding;
  final String? emptyAnimation;
  final String? emptyMessage;
  final String? failureAnimation;
  final String? failureMessage;
  const ProductItems({
    super.key,
    required this.isLoading,
    required this.isFailure,
    required this.products,
    this.animationTopPadding,
    this.emptyAnimation,
    this.emptyMessage,
    this.failureAnimation,
    this.failureMessage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGrid(
      shrinkWrap: true,
      items: products,
      crossAxisCount: 2,
      isFailure: isFailure,
      isLoading: isLoading,
      childAspectRatio: 0.9,
      scrollDirection: Axis.vertical,
      emptyMessage: emptyMessage,
      failureMessage: failureMessage,
      emptyAnimation: emptyAnimation,
      failureAnimation: failureAnimation,
      animationTopPadding: animationTopPadding,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      emptyItems: List.generate(5, (index) => ProductModel.empty()),
      itemBuilder: (context, item) => GestureDetector(
        onTap: () => DialogServices.showCustomDialog(
          context: context,
          dialog: _Dialog(product: item),
        ),
        child: _Item(product: item),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel product;
  const _Item({required this.product});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              _Image(imageUrl: product.images.first, productId: product.id),
              SizedBox(height: 8.h),
              Expanded(child: _ItemBody(product: product)),
              SizedBox(height: 8.h),
            ],
          ),
        ),
        PositionedDirectional(
          end: 12.w,
          bottom: 12.h,
          child: _Carticon(product: product),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  final String productId;
  final double? height;
  const _Image({required this.imageUrl, required this.productId, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.white,
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: height ?? 100.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: FavouriteIcon(productId: productId),
        ),
      ],
    );
  }
}

class _ItemBody extends StatelessWidget {
  final double? spacing;
  final ProductModel product;
  const _ItemBody({required this.product, this.spacing = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        spacing: (spacing ?? 0).h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: product.title,
            size: 14.sp,
            maxLines: 3,
            type: Type.overMedium,
          ),
          CustomText(
            text: "${product.price.toStringAsFixed(2)} ${S.of(context).riyal}",
            size: 13.sp,
            type: Type.overMedium,
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}

class _Carticon extends StatelessWidget {
  final ProductModel product;
  const _Carticon({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is AddToCartLoading && state.productId == product.id) {
          return SizedBox(
            width: 24.w,
            height: 24.h,
            child: CircularProgressIndicator(),
          );
        }
        return GestureDetector(
          onTap: () => CartCubit.get(context).addToCart(product: product),
          child: Icon(IconBroken.Buy, size: 24.sp),
        );
      },
    );
  }
}

class _Dialog extends StatelessWidget {
  final ProductModel product;
  const _Dialog({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        _DialogImages(product: product),
        SizedBox(
          width: double.infinity,
          child: _ItemBody(spacing: 5.h, product: product)
        ),
        _DialogActions(product: product),
      ],
    );
  }
}

class _DialogImages extends StatelessWidget {
  final ProductModel product;
  const _DialogImages({required this.product});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      itemBuilder: (context, index, realIndex) => _Image(
        imageUrl: product.images[index],
        productId: product.id,
        height: 125.h,
      ),
      options: CarouselOptions(
        height: 125.h,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
      ),
    );
  }
}

class _DialogActions extends StatelessWidget {
  final ProductModel product;
  const _DialogActions({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder:(context, state) =>  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 0.h),
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: CustomButton(
            isLoading: state is AddToCartLoading && state.productId == product.id,
            height: 42.h,
            icon: IconBroken.Buy,
            text: S.of(context).addToCart,
            onPressed: () async {
              CartCubit.get(context).addToCart(product: product);
              Navigator.of(context).pop();
            } 
          )
        )
      )
    );
  }
}