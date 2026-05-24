import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class BannerRepo {
  Future<Either<Failure, List<String>>> getBanners();
}
