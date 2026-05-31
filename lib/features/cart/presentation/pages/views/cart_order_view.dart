import 'package:flutter/material.dart';
import '../widgets/cart_order_body.dart';
import '../../../data/model/cart_model.dart';
import '../../../../../core/widgets/custom_background.dart';

class CartOrderView extends StatelessWidget {
  final CartModel cartItem;
  const CartOrderView({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: CartOrderBody(cartItem: cartItem),
    );
  }
}

