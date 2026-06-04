import '../../../../const_data/firebase_assets.dart';
import '../model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../home/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  CollectionReference get _cartItems => _firestore
      .collection(FirebaseAssets.userCollection)
      .doc(userId)
      .collection(FirebaseAssets.cartCollection);

  Future<List<CartModel>> fetchCartProducts() async {
    final snapshot = await _cartItems.get();

    return snapshot.docs.map((doc) {
      return CartModel.fromFirestore(
        doc.data() as Map<String, dynamic>,
      ).copyWith(id: doc.id);
    }).toList();
  }

Future<CartModel> addToCart(ProductModel product) async {
  final docRef = _cartItems.doc(product.id);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    final model = CartModel.fromFirestore(docSnapshot.data() as Map<String, dynamic>);
    final updated = model.copyWith(
      quantity: model.quantity + 1,
      totalPrice: model.totalPrice + product.price,
    );
    await docRef.update(updated.toFirestore());
    return updated;
  }

  final newItem = CartModel(
    id: product.id, // الاعتماد على الـ ID الخاص بالمنتج
    quantity: 1,
    product: product,
    totalPrice: product.price,
  );
  await docRef.set(newItem.toFirestore());
  return newItem;
}


  Future<void> updateCartQuantity(String cartId, int quantity, double totalPrice) async {
    await _cartItems.doc(cartId).update({
      'quantity': quantity,
      'totalPrice': totalPrice,
    });
  }

  Future<void> removeFromCart(String cartId) async {
    await _cartItems.doc(cartId).delete();
  }
}
