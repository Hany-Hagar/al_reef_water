import 'package:dartz/dartz.dart';

import 'product_repo.dart';
import '../models/product_model.dart';
import '../database/product_data.dart';
import '../../../../core/failure/failure.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductData productData;
  ProductRepoImpl({required this.productData});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final querySnapshot = await productData.fetchProducts();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}