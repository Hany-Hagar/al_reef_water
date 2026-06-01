import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../const_data/firebase_assets.dart';

class ProfileData {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  ProfileData([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _auth = FirebaseAuth.instance;

  Future<DocumentSnapshot> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    var uid = _auth.currentUser!.uid;
    await _firestore.collection(FirebaseAssets.userCollection).doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
    }, SetOptions(merge: true));

    return _firestore.collection(FirebaseAssets.userCollection).doc(uid).get();
  }


  Future<void> deleteProfile() async {
    var uid = _auth.currentUser!.uid;
    await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .delete();
  }
}
