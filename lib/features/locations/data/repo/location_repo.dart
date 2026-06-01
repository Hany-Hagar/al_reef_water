import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../models/location_model.dart';

abstract class LocationRepo {
  Future<Either<Failure, List<LocationModel>>> getLocations();

  Future<Either<Failure, LocationModel>> addLocation(LocationModel location);

  Future<Either<Failure, LocationModel>> updateLocation(String id, LocationModel location);

  Future<Either<Failure, bool>> deleteLocation(String id);
}