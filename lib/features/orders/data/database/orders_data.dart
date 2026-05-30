import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../const_data/firebase_assets.dart';

class OrdersData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getOrders() async {
    return _firestore
        .collection(FirebaseAssets.ordersCollection)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<DocumentReference> addOrder(Map<String, dynamic> orderData) async {
    return await _firestore
        .collection(FirebaseAssets.ordersCollection)
        .add(orderData);
  }
}
