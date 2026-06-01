import '../../../home/data/models/product_model.dart';

class CartModel {
  final String id;
  final int quantity;
  final ProductModel product;
  final double totalPrice;
  CartModel({
    required this.id,
    required this.quantity,
    required this.product,
    required this.totalPrice,
  });

  // Empty
  factory CartModel.empty() {
    return CartModel(
      id: '',
      quantity: 0,
      totalPrice: 0.0,
      product: ProductModel.empty(),
    );
  }

  // FromFirestore
  factory CartModel.fromFirestore(Map<String, dynamic> data) {
    return CartModel(
      id: data['id'] ?? '',
      quantity: data['quantity'] ?? 0,
      totalPrice: data['totalPrice'] ?? 0.0,
      product: ProductModel.fromMap(
        (data['product'] as Map<String, dynamic>?) ?? <String, dynamic>{},
      ),
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'quantity': quantity,
      'product': product.toMap(),
      'totalPrice': totalPrice,
    };
  }

  // CopyWith
  CartModel copyWith({
    String? id,
    int? quantity,
    ProductModel? product,
    double? totalPrice,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

