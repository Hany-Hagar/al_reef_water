import 'location_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/location_model.dart';
import '../database/location_data.dart';
import '../../../../core/failure/failure.dart';

class LocationRepoImpl extends LocationRepo {
  final LocationData locationData;

  LocationRepoImpl({required this.locationData});

  @override
  Future<Either<Failure, List<LocationModel>>> getLocations() async {
    try {
      final docs = await locationData.fetchUserLocations();
      final locations = docs.map((doc) {
        final data = doc.data();
        return LocationModel.fromFirestore(data);
      }).toList();
      return Right(locations);
    } catch (e) {
      return Left(Failure.handle('Failed to fetch locations: $e'));
    }
  }

  @override
  Future<Either<Failure, LocationModel>> addLocation(LocationModel location) async {
    try {
      final doc = await locationData.addLocation(location.toFirestore());
      return Right(LocationModel.fromFirestore(doc.data()!));
    } catch (e) {
      return Left(Failure.handle('Failed to add location: $e'));
    }
  }

  @override
  Future<Either<Failure, LocationModel>> updateLocation(String id, LocationModel location) async {
    try {
      await locationData.updateLocation(id, location.toFirestore());
      return Right(location);
    } catch (e) {
      return Left(Failure.handle('Failed to update location: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteLocation(String id) async {
    try {
      await locationData.deleteLocation(id);
      return Right(true);
    } catch (e) {
      return Left(Failure.handle('Failed to delete location: $e'));
    }
  }
  
}
