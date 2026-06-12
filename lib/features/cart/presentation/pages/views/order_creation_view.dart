import 'package:flutter/material.dart';
import '../widgets/order_creation_body.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class OrderCreationView extends StatelessWidget {
  const OrderCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: CustomAppBar(title: "إنشاء طلب"),
      body: const OrderCreationBody(),
    );
  }
}