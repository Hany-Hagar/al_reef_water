import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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


Future<void> deleteProfile({required bool isGoogleUser}) async {
    final user = _auth.currentUser;
    if (user == null) return;
    final uid = user.uid;
    await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .delete();

    if (isGoogleUser) {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await user.reauthenticateWithCredential(credential);
    } else {
      final email = user.email;
      String password = "USER_PASSWORD"; 
      final credential = EmailAuthProvider.credential(
        email: email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
    }
    await user.delete();
  }
}

