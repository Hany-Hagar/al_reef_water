import '../../data/models/location_model.dart';

sealed class LocationState {}

class LocationInitialState extends LocationState {}

class RegionLoading extends LocationState {}

class RegionLoaded extends LocationState {}

class RegionError extends LocationState {
  final String message;

  RegionError(this.message);
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations;

  LocationLoaded(this.locations);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}

class RegionSelected extends LocationState {}

class CitySelected extends LocationState {}

class DistrictSelected extends LocationState {}

class SetNewLocation extends LocationState {}

class AddLocationLoading extends LocationState {}

class AddLocationSuccess extends LocationState {
  final LocationModel location;

  AddLocationSuccess(this.location);
}

class UpdateLocationLoading extends LocationState {}

class UpdateLocationSuccess extends LocationState {
  final LocationModel location;

  UpdateLocationSuccess(this.location);
}

class DeleteLocationLoading extends LocationState {}

class DeleteLocationSuccess extends LocationState {
  final String locationId;

  DeleteLocationSuccess(this.locationId);
}
