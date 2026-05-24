import 'package:cloud_firestore/cloud_firestore.dart';

class BannerData {
  final FirebaseFirestore _firestore;
  BannerData([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance;
  Future<QuerySnapshot> fetchBanners() async {
    return await _firestore.collection('banners').get();
  }
}
