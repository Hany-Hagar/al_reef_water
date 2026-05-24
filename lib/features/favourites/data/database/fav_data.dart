import 'package:firebase_auth/firebase_auth.dart';
import '../../../../const_data/firebase_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavData {

  Future<List<String>> getFavoriteProductIds() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .get();
    final data = doc.data() ?? {};
    final favorites = (data['favorites'] as List<dynamic>? ?? <dynamic>[])
        .map((item) => item.toString())
        .toList();

    return favorites;
  }

  Future<void> addToFavorites(String productId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .update({
          'favorites': FieldValue.arrayUnion([productId]),
        });
  }

  Future<void> removeFromFavorites(String productId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .update({
          'favorites': FieldValue.arrayRemove([productId]),
        });
  }
}
