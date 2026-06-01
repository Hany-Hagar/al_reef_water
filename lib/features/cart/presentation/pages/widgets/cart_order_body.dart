import 'package:flutter/material.dart';
import '../../../data/model/cart_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartOrderBody extends StatelessWidget {
  final CartModel cartItem;
  const CartOrderBody({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomText(
          text: cartItem.product.title,
          size: 30.sp,
          maxLines: 5,
        ),
        CustomText(
          text: cartItem.product.title,
          size: 24.sp,
          maxLines: 5,
          type: Type.overMedium,
        ),
        const SizedBox(height: 10),
        CustomText(
          text: 'Price: \$${cartItem.product.price * cartItem.quantity}',
          size: 18.sp,
        ),
      ],
    );
  }
}


