import 'package:firebase_auth/firebase_auth.dart';
import '../../../home/data/models/product_model.dart';
import 'location_model.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final List<LocationModel> location;
  final String? password;
  final String phone;
  final String email;
  List<String> favorites;
  final List<ProductModel> cart;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.location,
    required this.email,
    this.password,
    required this.favorites,
    this.cart = const [],
  });

  // From Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      firstName: user.displayName ?? '',
      lastName: '',
      location: [LocationModel.empty()],
      phone: user.phoneNumber ?? '',
      email: user.email ?? '',
      favorites: [],
      cart: [],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '').toString(),
      firstName: (map['firstName'] ?? '').toString(),
      lastName: (map['lastName'] ?? '').toString(),
      phone: (map['phone'] ?? '').toString(),
      email: (map['email'] ?? '').toString(),
      location: (map['location'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => LocationModel.fromFirestore(item as Map<String, dynamic>))
          .toList(),
      favorites: (map['favorites'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => item.toString())
          .toList(),
      cart: (map['cart'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => ProductModel.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      "location":location.map((item) => item.toFirestore()).toList(),
      'favorites': favorites,
      'cart': cart.map((item) => item.toMap()).toList(),
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
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      location: location??this.location,
      email: email ?? this.email,
      favorites: favorites ?? this.favorites,
      cart: cart ?? this.cart,
    );
  }
}
