import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../const_data/firebase_assets.dart';

class LocationData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  // Fetch user locations
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  fetchUserLocations() async {
    final snapshot = await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(userId)
        .collection(FirebaseAssets.locationsCollection)
        .get();

    return snapshot.docs;
  }

  // Add a new location and return newly created document reference
  Future<DocumentSnapshot<Map<String, dynamic>>> addLocation(
    Map<String, dynamic> locationData,
  ) async {
    final docRef = _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(userId)
        .collection(FirebaseAssets.locationsCollection)
        .doc();
    await docRef.set({...locationData, 'id': docRef.id});
    return await docRef.get();
  }

  // Update an existing location
  Future<void> updateLocation(
    String locationId,
    Map<String, dynamic> locationData,
  ) async {
    return await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(userId)
        .collection(FirebaseAssets.locationsCollection)
        .doc(locationId)
        .update(locationData);
  }

  // Delete a location
  Future<void> deleteLocation(String locationId) async {
    return await _firestore
        .collection(FirebaseAssets.userCollection)
        .doc(userId)
        .collection(FirebaseAssets.locationsCollection)
        .doc(locationId)
        .delete();
  }
}
