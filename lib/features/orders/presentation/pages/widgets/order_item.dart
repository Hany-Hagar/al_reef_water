import 'package:flutter/material.dart';
import '../../../data/models/order_model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem({super.key , required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text('Order Item'),
    );
  }
}
