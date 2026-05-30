import 'package:flutter/material.dart';
import 'package:osm_search_and_pick/open_street_map_search_and_pick.dart';

class LocationService {
  static Future<void> openLocationPicker({
    required BuildContext context,
    required Function(PickedData) onLocationPicked,
  }) async {
    try {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('اختر الموقع'),
              backgroundColor: Colors.blue,
            ),
            body: OpenStreetMapSearchAndPick(
              buttonText: 'تأكيد الموقع',
              locationPinText: 'اختر الموقع الخاص بك',
              hintText: 'ابحث عن الموقع...',
              buttonColor: Colors.blue,
              locationPinIconColor: Colors.blue,
              onPicked: (pickedData) {
                Navigator.pop(context, pickedData);
              },
            ),
          ),
          fullscreenDialog: true,
        ),
      );

      if (result != null) {
        onLocationPicked(result);
      }
    } catch (e) {
      // تم تصحيح الـ print هنا أيضاً
      debugPrint("❌ Error opening location picker: $e");
    }
  }
}
