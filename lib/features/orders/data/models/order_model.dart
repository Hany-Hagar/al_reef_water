import '../../../cart/data/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../locations/data/models/location_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String firstName;
  final String lastName;
  final String phone;
  final LocationModel location;
  final double totalPrice;
  final List<CartModel> cartItems;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? cancelledAt;
  OrderModel({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.location,
    required this.totalPrice,
    required this.cartItems,
    required this.status,
    required this.createdAt,
    this.cancelledAt,
  });

  // Empty
  factory OrderModel.empty() {
    return OrderModel(
      id: '',
      userId: '',
      firstName: '',
      lastName: '',
      phone: '',
      location: LocationModel.empty(),
      totalPrice: 0.0,
      cartItems: const [],
      status: OrderStatus.pending,
      createdAt: DateTime.now(),

    );
  }

  // CopyWith
  OrderModel copyWith({
    String? id,
    String? userId,
    String? firstName,
    String? lastName,
    String? phone,
    LocationModel? location,
    double? totalPrice,
    List<CartModel>? cartItems,
    OrderStatus? status,
    DateTime? createdAt,
    DateTime? cancelledAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      totalPrice: totalPrice ?? this.totalPrice,
      cartItems: cartItems ?? this.cartItems,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }

  // FromFirestore
  factory OrderModel.fromFirestore(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      phone: data['phone'] ?? '',
      location: LocationModel.fromFirestore(
        (data['location'] as Map<String, dynamic>?) ?? <String, dynamic>{},
      ),
      totalPrice: (data['totalPrice'] as num?)?.toDouble() ?? 0.0,
      cartItems:
          (data['cartItems'] as List<dynamic>?)
              ?.map(
                (item) => CartModel.fromFirestore(item as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${data['status']}',
        orElse: () => OrderStatus.pending,
      ),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      cancelledAt: (data['cancelledAt'] as Timestamp?)?.toDate(),
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'location': location.toFirestore(),
      'totalPrice': totalPrice,
      'cartItems': cartItems.map((item) => item.toFirestore()).toList(),
      'status': status.toString().split('.').last,
      'createdAt': createdAt,
      if (cancelledAt != null) 'cancelledAt': cancelledAt,
    };
  }
}

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  outForDelivery,
  delivered,
  cancelled,
}