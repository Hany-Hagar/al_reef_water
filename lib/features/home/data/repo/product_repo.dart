import 'package:dartz/dartz.dart';
import '../models/product_model.dart';
import '../../../../core/failure/failure.dart';

abstract class ProductRepo {
  Future<
    Either<
      Failure,
      ({
        List<ProductModel> user,
        List<ProductModel> mosque,
        List<ProductModel> company,
      })
    >
  >
  getProducts();
}
