import 'favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../../../cart/presentation/manager/cart_states.dart';


class HomeProductItem extends StatelessWidget {
  final ProductModel product;
  const HomeProductItem({super.key, required this.product});
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
            maxLines: 3,
            type: Type.overMedium,
          ),
          CustomText(
            text: "${product.price.toStringAsFixed(2)} ر.س",
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
          onTap: () => CartCubit.get(context).addToCart(product),
          child: Icon(IconBroken.Buy, size: 24.sp),
        );
      },
    );
  }
}
