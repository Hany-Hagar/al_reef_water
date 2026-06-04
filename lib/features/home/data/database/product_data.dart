import '../../../../const_data/firebase_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  final FirebaseFirestore _firestore;
  ProductData([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<QuerySnapshot> fetchProducts() async {
    return await _firestore.collection(FirebaseAssets.productCollection).get();
  }
}
