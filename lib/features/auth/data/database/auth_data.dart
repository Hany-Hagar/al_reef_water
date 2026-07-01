import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../const_data/firebase_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore;

  AuthData([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Login
  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Login with Google
  Future<DocumentSnapshot> getUserData(String uid) async {
    return await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(uid)
        .get();
  }

  Future<OAuthCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    await googleSignIn.signOut();
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    return credential;
  }

  // Register
  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Add user data to Firestore
  Future<void> addUserData({
    required String uid,
    required UserModel userModel,
  }) async {
    await _firestore.collection(FirebaseAssets.userCollection).doc(uid).set({
      ...userModel.toMap(),
      "type": 'customer',
    });
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
