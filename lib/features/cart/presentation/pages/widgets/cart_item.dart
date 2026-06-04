import 'package:flutter/material.dart';
import '../../manager/cart_cubit.dart';
import '../../manager/cart_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final bool isLoading;
  final CartModel cart;
  const CartItem({super.key, this.isLoading = false, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        height: 135.h,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: _Image(imageUrl: cart.product.images.first),
              ),
            ),
            Expanded(
              flex: 4,
              child: _Body(isLoading: isLoading, cart: cart),
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  const _Image({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final bool isLoading;
  final CartModel cart;
  const _Body({required this.isLoading, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(title: cart.product.title),
          SizedBox(height: 5.h),
          _Price(price: cart.product.price),
          SizedBox(height: 5.h),
          _TotalPrice(total: cart.totalPrice),
          SizedBox(height: 5.h),
          _CountDetails(isLoading: isLoading, cartId: cart.id),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      size: 12.sp,
      maxLines: 3,
      type: Type.overMedium,
    );
  }
}

class _Price extends StatelessWidget {
  final double price;
  const _Price({required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: S.of(context).price, size: 13.sp, type: Type.overMedium),
        CustomText(
          text: "${price.toStringAsFixed(2)} ${S.of(context).riyal}",
          size: 13.sp,
          type: Type.medium,
        ),
      ],
    );
  }
}

class _TotalPrice extends StatelessWidget {
  final double total;
  const _TotalPrice({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: S.of(context).total, size: 13.sp, type: Type.overMedium),
        CustomText(
          text: "${total.toStringAsFixed(2)} ${S.of(context).riyal}",
          size: 13.sp,
          type: Type.medium,
        ),
      ],
    );
  }
}

class _CountDetails extends StatelessWidget {
  final bool isLoading;
  final String cartId;
  const _CountDetails({required this.isLoading, required this.cartId});

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => Row(
        children: [
          CustomText(text: S.of(context).quantity, size: 13.sp, type: Type.overMedium),
          Expanded(
            child: Row(
              children: [
                _CountButton(
                  isLoading: isLoading,
                  icon: Icons.add,
                  onTap: () => cubit.increaseCartQuantity(cartId),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomText(
                    text: CartCubit.get(context).getItemCount(cartId),
                    size: 14.sp,
                    type: Type.overMedium,
                  ),
                ),
                _CountButton(
                  isLoading: isLoading,
                  icon: Icons.remove,
                  onTap: () => cubit.decreaseCartQuantity(cartId),
                ),
              ],
            ),
          ),
          _DeleteIcon(cartId: cartId),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}

class _CountButton extends StatelessWidget {
  final bool isLoading;
  final IconData icon;
  final VoidCallback onTap;

  const _CountButton({
    required this.isLoading,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: onTap,
      child: Container(
        width: 26.w,
        height: 26.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isLoading
              ? Theme.of(context).disabledColor
              : Theme.of(context).primaryColor,
        ),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }
}

class _DeleteIcon extends StatelessWidget {
  final String cartId;
  const _DeleteIcon({required this.cartId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is RemoveFromCartLoading && state.cartId == cartId) {
          return SizedBox(
            width: 24.w,
            height: 24.h,
            child: CircularProgressIndicator(),
          );
        }
        return GestureDetector(
          onTap: () => CartCubit.get(context).removeFromCart(cartId),
          child: Icon(IconBroken.Delete, size: 24.sp, color: Colors.red),
        );
      },
    );
  }
}
