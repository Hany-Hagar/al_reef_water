
import '../model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../home/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  CollectionReference get _cartItems => _firestore
      .collection('cart')
      .doc(userId)
      .collection('items');

  Future<List<CartModel>> fetchCartProducts() async {
    final snapshot = await _cartItems.get();

    return snapshot.docs.map((doc) {
      return CartModel.fromFirestore(doc.data() as Map<String, dynamic>)
          .copyWith(id: doc.id);
    }).toList();
  }

  Future<CartModel> addToCart(ProductModel product) async {
    final query = await _cartItems
        .where('product.id', isEqualTo: product.id)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      final doc = query.docs.first;

      final model = CartModel.fromFirestore(doc.data() as Map<String, dynamic>);
      final updated = model.copyWith(quantity: model.quantity + 1);

      await doc.reference.update(updated.toFirestore());
      return updated;
    }

    final docRef = _cartItems.doc();

    final newItem = CartModel(
      id: docRef.id,
      quantity: 1,
      status: OrderStatus.pending,
      product: product,
    );

    await docRef.set(newItem.toFirestore());
    return newItem;
  }

  Future<void> updateCartQuantity(String cartId, int quantity) async {
    await _cartItems.doc(cartId).update({'quantity': quantity});
  }

  Future<void> removeFromCart(String cartId) async {
    await _cartItems.doc(cartId).delete();
  }
}
