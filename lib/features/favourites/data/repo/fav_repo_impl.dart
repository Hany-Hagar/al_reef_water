import 'fav_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/fav_data.dart';
import '../../../../core/failure/failure.dart';

class FavRepoImpl extends FavRepo {
  final FavData favData;
  FavRepoImpl({required this.favData});

  @override
  Future<Either<Failure, List<String>>> getFavoriteProductIds() async {
    try {
      var result = await favData.getFavoriteProductIds();
      return Right(result);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToFav(String productId) async {
    try {
      var result = await FavData().addToFavorites(productId);
      return Right(result);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFav(String productId) async {
    try {
      var result = await FavData().removeFromFavorites(productId);
      return Right(result);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
