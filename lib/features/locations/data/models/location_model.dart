import 'package:osm_search_and_pick/models/picked_data.dart';

class LocationModel {
  final String id;
  final String name;

  final String country;
  final String region;
  final String city;
  final String district;
  final String street;
  final String buildingNumber;
  final int floor;

  LocationModel({
    required this.id,
    required this.name,
    required this.country,
    required this.region,
    required this.city,
    required this.district,
    required this.street,
    required this.buildingNumber,
    required this.floor,
  });

  // Empty Factory
  factory LocationModel.empty() {
    return LocationModel(
      id: '',
      name: '',
      country: '',
      region: '',
      city: '',
      district: '',
      street: '',
      buildingNumber: '',
      floor: 0,
    );
  }

  // CopyWith
  LocationModel copyWith({
    String? id,
    String? name,
    String? country,
    String? region,
    String? city,
    String? district,
    String? street,
    String? buildingNumber,
    int? floor,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      region: region ?? this.region,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floor: floor ?? this.floor,
    );
  }

  // From OSM
  factory LocationModel.fromOSM({
    required String title,
    required int floor,
    required PickedData pickedData,
  }) {
    return LocationModel(
      id: "",
      name: title,
      floor: floor,
      country: pickedData.address['country'] ?? '',
      region: pickedData.address['region'] ?? '',
      city: pickedData.address['city'] ?? '',
      district: pickedData.address['district'] ?? '',
      street: pickedData.address['street'] ?? '',
      buildingNumber: pickedData.address['buildingNumber'] ?? '',
    );
  }

  // FromFirestore
  factory LocationModel.fromFirestore(Map<String, dynamic> data) {
    return LocationModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      country: data['country'] ?? '',
      region: data['region'] ?? '',
      city: data['city'] ?? '',
      district: data['district'] ?? '',
      street: data['street'] ?? '',
      buildingNumber: data['buildingNumber'] ?? '',
      floor: data['floor'] ?? 0,
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'country': country,
      'region': region,
      'city': city,
      'district': district,
      'street': street,
      'buildingNumber': buildingNumber,
      'floor': floor,
    };
  }
}
