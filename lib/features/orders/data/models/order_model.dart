import '../../../cart/data/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final CartModel cart;
  final DateTime orderDate;
  final double totalAmount;
  
  OrderModel({
    required this.id,
    required this.userId,
    required this.cart,
    required this.orderDate,
    required this.totalAmount,
  });

  // Empty
  factory OrderModel.empty() {
    return OrderModel(
      id: '',
      userId: '',
      cart: CartModel.empty(),
      orderDate: DateTime.now(),
      totalAmount: 0.0,
    );
  }

  // FromFirestore
  factory OrderModel.fromFirestore(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      cart: CartModel.fromFirestore(
        (data['cart'] as Map<String, dynamic>?) ?? <String, dynamic>{},
      ),
      orderDate: (data['orderDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'cart': cart.toFirestore(),
      'orderDate': orderDate,
      'totalAmount': totalAmount,
    };
  }
}

