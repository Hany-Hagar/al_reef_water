import 'dart:convert';
import '../models/region_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../../../../const_data/asset_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../const_data/firebase_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  // Fetch Regions
  Future<List<RegionModel>> loadRegions() async {
    final String jsonString = await rootBundle.loadString(AssetData.regionFile);
    return await compute(_parseAndConvertJson, jsonString);
  }

  List<RegionModel> _parseAndConvertJson(String rawJson) {
    final List<dynamic> parsedData = json.decode(rawJson);
    return parsedData.map((item) => RegionModel.fromJson(item)).toList();
  }

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
