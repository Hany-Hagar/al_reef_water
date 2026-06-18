import 'package:al_reef_app/features/orders/data/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../const_data/firebase_assets.dart';

class OrdersData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get userId => _auth.currentUser?.uid;

  Future<QuerySnapshot<Map<String, dynamic>>> getOrders() async {
    if (userId == null) {
      throw StateError('User is not authenticated');
    }

    return await _firestore
        .collection(FirebaseAssets.ordersCollection)
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
  }

  Future<DocumentReference<Map<String, dynamic>>> addOrder(
    OrderModel orderData,
  ) async {
    if (userId == null) {
      throw StateError('User is not authenticated');
    }

    final batch = _firestore.batch();

    final orderRef = _firestore
        .collection(FirebaseAssets.ordersCollection)
        .doc();

    // Add Order
    batch.set(orderRef, orderData.toFirestore());

    // Clear Cart
    for (var item in orderData.cartItems) {
      final cartItemRef = _firestore
          .collection(FirebaseAssets.userCollection)
          .doc(userId)
          .collection(FirebaseAssets.cartCollection)
          .doc(item.id);

      batch.delete(cartItemRef);
    }

    await batch.commit();

    return orderRef;
  }

  Future<void> cancelOrder(String orderId) async {
    if (userId == null) {
      throw StateError('User is not authenticated');
    }

    await _firestore
        .collection(FirebaseAssets.ordersCollection)
        .doc(orderId)
        .update({
          "status": OrderStatus.cancelled.name,
          "cancelledAt": FieldValue.serverTimestamp(),
        });
  }
}
