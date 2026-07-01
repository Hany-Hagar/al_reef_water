import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String id;
  final int index;
  final String imageUrl;

  BannerModel({required this.id, required this.index, required this.imageUrl});

  BannerModel copyWith({String? id, int? index, String? imageUrl}) {
    return BannerModel(
      id: id ?? this.id,
      index: index ?? this.index,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
    factory BannerModel.empty() {
    return BannerModel(
      id: '',
      index: 0,
      imageUrl:
          'https://cdn.salla.sa/gOAgp/df1f7cc5-af34-430e-b42d-e9672ededf60-1000x667-mvF8acNaCiRDuFWbvu4wkUsXWhqwB4wjEzOsIXX9.jpg',
    );
  }

  factory BannerModel.fromFirestore(QueryDocumentSnapshot<Object?> doc) {
    return BannerModel(
      id: doc.id,
      index: doc['index'] as int,
      imageUrl: doc['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'index': index, 'image_url': imageUrl};
  }
}
