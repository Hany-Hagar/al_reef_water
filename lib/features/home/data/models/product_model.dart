import 'package:cloud_firestore/cloud_firestore.dart';

enum OfferType { user, mosque, company }

class ProductModel {
  final String id;
  final String title;
  final double price;
  final OfferType offerType;
  final List<String> images;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.offerType,
  });

  // Empty
  factory ProductModel.empty() {
    return const ProductModel(
      id: '',
      title: 'قارورة مياه الريف - عبوة 600 مل -تعبئة الكرتونل',
      price: 0.0,
      images: [
        "https://cdn.salla.sa/gOAgp/df1f7cc5-af34-430e-b42d-e9672ededf60-1000x667-mvF8acNaCiRDuFWbvu4wkUsXWhqwB4wjEzOsIXX9.jpg",
      ],
      offerType: OfferType.user,
    );
  }

  // FromFirestore constructor
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return ProductModel.fromMap(data).copyWith(id: doc.id);
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: (data['id'] ?? '').toString(),
      title: (data['title'] ?? '').toString(),
      price: (data['price'] as num? ?? 0).toDouble(),
      images: (data['images'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => item.toString())
          .toList(),
      offerType: OfferType.values.firstWhere(
        (e) => e.name == data['offerType'],
        orElse: () => OfferType.user,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'images': images,
      'offerType': offerType.toString(),
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    double? price,
    List<String>? images,
    OfferType? offerType,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      images: images ?? this.images,
      offerType: offerType ?? this.offerType,
    );
  }
}

List<ProductModel> sampleProducts(OfferType offerType) {
  return [
    ProductModel(
      id: '',
      title: 'مياة الريف - عبوة 200 مل - 48× 200 مل',
      price: 11.0,
      images: [
        'https://cdn.salla.sa/gOAgp/df1f7cc5-af34-430e-b42d-e9672ededf60-1000x667-mvF8acNaCiRDuFWbvu4wkUsXWhqwB4wjEzOsIXX9.jpg',
        'https://cdn.salla.sa/gOAgp/2a5b535e-cc8b-400a-ad27-23c212177a1e-1000x667-8kLanK7CEDUfmyCfZgwsUxAkXOLWD9MKXkdPKllq.jpg',
        'https://cdn.salla.sa/gOAgp/2a5b535e-cc8b-400a-ad27-23c212177a1e-1000x667-8kLanK7CEDUfmyCfZgwsUxAkXOLWD9MKXkdPKllq.jpg',
      ],
      offerType: offerType,
    ),
    ProductModel(
      id: '',
      title: 'حزمة مياه الريف 24 حبة × 330 مل',
      price: 6.0,
      images: [
        'https://cdn.salla.sa/gOAgp/8fdbfd35-e37d-445a-be11-54bb63f1fa97-1000x666.66666666667-2F37NXAyxWo5Rwblz8asCtP9hN691H2vf20j8I2R.png',
        'https://cdn.salla.sa/gOAgp/3de2490a-4bb1-405e-88ec-9cd6579e96d1-1000x666.66666666667-EeyoUNsCa5FV5V7hPxAAZMgIeXpMOpvMHqzAY0kq.jpg',
      ],
      offerType: offerType,
    ),
    ProductModel(
      id: '',
      title: 'مياة الريف - عبوة 330مل -40 قارورة × 330 مل',
      price: 11.0,
      images: [
        'https://cdn.salla.sa/gOAgp/8a7ea76e-51d3-459a-b350-3aa7d852d4a8-1000x666.66666666667-6orlrXcymKcLfeLDHccTcurUaSzfFZX3S2Tq224i.png',
        'https://cdn.salla.sa/gOAgp/6d9a836d-c097-4caa-acd4-406a29fd7464-1000x667-RZyFEQW54MNG4QppMKTRUGKLXjZSmSkm7p6jhu0r.jpg',
        'https://cdn.salla.sa/gOAgp/b6635d81-7e49-493c-beff-5a4585d4d7f3-1000x666.40625-ihGdVI6fc6cfxZdnxIO8sIJ7kh1qyORwNzr9HgYQ.jpg',
      ],
      offerType: offerType,
    ),
    ProductModel(
      id: '',
      title: 'مياة الريف-عبوة 600 مل -تعبئة الكرتون -30 قارورة*600 مل',
      price: 11.0,
      images: [
        'https://cdn.salla.sa/gOAgp/1a7a28c5-343a-4d5c-a409-bfd461760de0-1000x666.66666666667-5cbV5bd5YaoxTDZ8i8G4MrCMpg50q9lef0Lq8ifg.jpg',
        'https://cdn.salla.sa/gOAgp/4d340499-89f8-4ff6-8e9d-270d6dbb855a-1000x666.40625-eYy716chhdZXRthWeOvPKLmZS3EeZAK0otwJ0053.jpg',
      ],
      offerType: offerType,
    ),
  ];
}
