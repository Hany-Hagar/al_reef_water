import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class FavRepo {
  Future<Either<Failure, List<String>>> getFavoriteProductIds();
  Future<Either<Failure, void>> addToFav(String productId);
  Future<Either<Failure, void>> removeFromFav(String productId);
}