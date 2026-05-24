import '../../../home/data/models/product_model.dart';

class CartModel {
  final String id;
  final int quantity;
  final OrderStatus status;
  final ProductModel product;
  CartModel({
    required this.id,
    required this.quantity,
    required this.status,
    required this.product,
  });

  // Empty
  factory CartModel.empty() {
    return CartModel(
      id: '',
      quantity: 0,
      status: OrderStatus.pending,
      product: ProductModel.empty(),
    );
  }

  // FromFirestore
  factory CartModel.fromFirestore(Map<String, dynamic> data) {
    return CartModel(
      id: data['id'] ?? '',
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${data['status']}',
        orElse: () => OrderStatus.pending,
      ),
      quantity: data['quantity'] ?? 0,
      product: ProductModel.fromMap(
        (data['product'] as Map<String, dynamic>?) ?? <String, dynamic>{},
      ),
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'status': status.toString().split('.').last,
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  // CopyWith
  CartModel copyWith({
    String? id,
    OrderStatus? status,
    int? quantity,
    ProductModel? product,
  }) {
    return CartModel(
      id: id ?? this.id,
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }
}

enum OrderStatus { pending, preparing, onTheWay, delivered, cancelled }
