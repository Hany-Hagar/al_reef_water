import '../../../cart/data/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final List<CartModel> cart;
  final DateTime orderDate;
  final double totalAmount;
  final OrderStatus status;

  OrderModel({
    required this.id,
    required this.userId,
    required this.cart,
    required this.orderDate,
    required this.totalAmount,
    this.status = OrderStatus.pending,
  });

  // Empty
  factory OrderModel.empty() {
    return OrderModel(
      id: '',
      userId: '',
      cart: const [],
      orderDate: DateTime.now(),
      totalAmount: 0.0,
      status: OrderStatus.pending,
    );
  }

  // FromFirestore
  factory OrderModel.fromFirestore(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      cart:
          (data['cart'] as List<dynamic>?)
              ?.map(
                (item) => CartModel.fromFirestore(item as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      orderDate: (data['orderDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${data['status']}',
        orElse: () => OrderStatus.pending,
      ),
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'cart': cart.map((item) => item.toFirestore()).toList(),
      'orderDate': orderDate,
      'totalAmount': totalAmount,
      'status': status.toString().split('.').last,
    };
  }
}

enum OrderStatus { pending, processing, shipped, delivered, cancelled }
