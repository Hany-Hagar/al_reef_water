import 'package:flutter/material.dart';
import '../widgets/order_details_body.dart';
import '../../../data/model/cart_model.dart';
import '../../../../../core/widgets/custom_background.dart';

class OrderDetailsView extends StatelessWidget {
  final CartModel order;
  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: OrderDetailsBody(),
    );
  }
}