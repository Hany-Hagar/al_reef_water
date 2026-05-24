import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../const_data/firebase_assets.dart';

class ProfileData {
  final FirebaseFirestore _firestore;

  ProfileData([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<DocumentSnapshot> getProfile(String uid) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    return await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .get();
  }

  Future<void> updateProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .update(data);
  }

  Future<void> deleteProfile(String uid) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .delete();
  }
}
