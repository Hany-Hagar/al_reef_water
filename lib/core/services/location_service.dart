// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; 
import 'package:osm_search_and_pick/open_street_map_search_and_pick.dart';

class LocationService {
  static Future<LatLong> _getCurrentUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const LatLong(24.7136, 46.6753); 
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const LatLong(24.7136, 46.6753); 
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return const LatLong(24.7136, 46.6753); 
    } 

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    
    return LatLong(position.latitude, position.longitude);
  }

  static Future<void> openLocationPicker({
    required BuildContext context,
    required Function(PickedData) onLocationPicked,
  }) async {
    try {
      LatLong startCenter = await _getCurrentUserLocation();

      if (!context.mounted) return;

      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('اختر الموقع'),
              backgroundColor: Colors.blue,
            ),
            body: OpenStreetMapSearchAndPick(
              initialCenter: startCenter,    
              buttonText: 'تأكيد الموقع',
              locationPinText: 'اختر الموقع الخاص بك',
              hintText: 'ابحث عن الموقع في السعودية...',
              buttonColor: Colors.blue,
              locationPinIconColor: Colors.blue,
              showZoomButtons: true,
              showCurrentLocationButton: true,
              showSearchBar: true,
              showSetLocationButton: true,
              onPicked: (pickedData) {
                Navigator.pop(context, pickedData);
              },
              onMapMoved: (latLong) {},
              onSearchStatusChanged: (isSearching) {},
            ),
          ),
          fullscreenDialog: true,
        ),
      );

      if (result != null && result is PickedData) {
        onLocationPicked(result);
      }
    } catch (e) {
      debugPrint("❌ Error opening location picker: $e");
    }
  }
}
