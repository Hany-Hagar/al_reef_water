import 'package:dartz/dartz.dart';
import '../models/region_model.dart';
import '../models/location_model.dart';
import '../../../../core/failure/failure.dart';

abstract class LocationRepo {

  Future<Either<Failure,List<RegionModel>>> loadRegions();

  Future<Either<Failure, List<LocationModel>>> getLocations();

  Future<Either<Failure, LocationModel>> addLocation(LocationModel location);

  Future<Either<Failure, LocationModel>> updateLocation(String id, LocationModel location);

  Future<Either<Failure, bool>> deleteLocation(String id);
}