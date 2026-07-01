import 'package:firebase_auth/firebase_auth.dart';
import '../../../home/data/models/product_model.dart';
import '../../../locations/data/models/location_model.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? password;
  final String phone;
  final String email;
  final List<String> favorites;
  final bool isGoogleUser;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    this.password,
    required this.favorites,
    this.isGoogleUser = false,
  });

  // From Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      firstName: user.displayName ?? '',
      lastName: '',
      phone: user.phoneNumber ?? '',
      email: user.email ?? '',
      favorites: [],
      isGoogleUser: user.providerData.any((p) => p.providerId == 'google.com'),
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '').toString(),
      firstName: (map['firstName'] ?? '').toString(),
      lastName: (map['lastName'] ?? '').toString(),
      phone: (map['phone'] ?? '').toString(),
      email: (map['email'] ?? '').toString(),
      favorites: (map['favorites'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => item.toString())
          .toList(),
      isGoogleUser: (map['isGoogleUser'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'favorites': favorites,
      'isGoogleUser': isGoogleUser,
    };
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    List<LocationModel>? location,
    String? phone,
    String? email,
    List<String>? favorites,
    List<ProductModel>? cart,
    bool? isGoogleUser,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      favorites: favorites ?? this.favorites,
      isGoogleUser: isGoogleUser ?? this.isGoogleUser,
    );
  }
}
