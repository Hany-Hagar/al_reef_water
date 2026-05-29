import 'favourite_icon.dart';
import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../manager/product_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_grid.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../../../cart/presentation/manager/cart_states.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var products = ProductCubit.get(context).products;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomText(
                text: S.of(context).popularProducts,
                size: 20.sp,
                type: Type.header,
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: CustomGrid(
                items: products,
                isLoading: state is ProductLoading,
                isFailure: state is ProductFailure,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 0),
                emptyItems: List.generate(4, (index) => ProductModel.empty()),
                itemBuilder: (context, item) =>
                    _Item(product: item as ProductModel),
              ),
            ),
          ],
        );
      },
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
  const _Image({required this.imageUrl, required this.productId});

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
              height: 100.h,
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
  final ProductModel product;
  const _ItemBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: product.title,
            size: 14.sp,
            maxLines: 4,
            type: Type.overMedium,
          ),
          CustomText(
            text: "${product.price.toStringAsFixed(2)} ر.س",
            size: 12.sp,
            type: Type.overMedium,
          ),
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
          onTap: () => CartCubit.get(context).addToCart(product),
          child: Icon(IconBroken.Buy, size: 24.sp),
        );
      },
    );
  }
}
