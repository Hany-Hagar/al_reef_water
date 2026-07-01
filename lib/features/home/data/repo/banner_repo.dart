import 'package:dartz/dartz.dart';
import '../models/banner_model.dart';
import '../../../../core/failure/failure.dart';

abstract class BannerRepo {
  Future<Either<Failure, List<BannerModel>>> getBanners();
}
