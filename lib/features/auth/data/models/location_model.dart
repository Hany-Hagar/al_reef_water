import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final double latitude;
  final double longitude;

  final String country;
  final String city;
  final String district;

  final String fullAddress;

  final DateTime? createdAt;

  const LocationModel({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
    required this.district,
    required this.fullAddress,
    this.createdAt,
  });

  // Empty
  factory LocationModel.empty() {
    return LocationModel(
      latitude: 0.0,
      longitude: 0.0,
      country: '',
      city: '',
      district: '',
      fullAddress: '',
      createdAt: null,
    );
  }
  
  // CopyWith
  LocationModel copyWith({
    double? latitude,
    double? longitude,
    String? country,
    String? city,
    String? district,
    String? fullAddress,
    DateTime? createdAt,
  }) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
      fullAddress: fullAddress ?? this.fullAddress,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // FromOsm_search_and_pick
  LocationModel buildLocationFromOSM(Map data) {
    final address = data['address'] ?? {};
    final city = address['city'] ?? address['town'] ?? address['village'] ?? '';
    final district = address['suburb'] ?? address['neighbourhood'] ?? '';
    final country = address['country'] ?? '';
    final fullAddress = '${address['road'] ?? ''}, $district, $city, $country'
        .replaceAll(RegExp(r', ,'), ',')
        .replaceAll(RegExp(r'^,|,$'), '')
        .trim();

    return LocationModel(
      latitude: (data['lat'] as num).toDouble(),
      longitude: (data['lon'] as num).toDouble(),
      city: city,
      district: district,
      country: country,
      fullAddress: fullAddress,
      createdAt: DateTime.now(),
    );
  }

  // FromFirestore
  factory LocationModel.fromFirestore(Map<String, dynamic> data) {
    return LocationModel(
      latitude: (data['latitude'] as num).toDouble(),
      longitude: (data['longitude'] as num).toDouble(),
      country: data['country'] ?? '',
      city: data['city'] ?? '',
      district: data['district'] ?? '',
      fullAddress: data['fullAddress'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  // ToFirestore
  Map<String, dynamic> toFirestore() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'city': city,
      'district': district,
      'fullAddress': fullAddress,
      'createdAt': createdAt,
    };
  }
}
