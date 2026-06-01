import '../../data/models/location_model.dart';

sealed class LocationState {}

class LocationInitialState extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations;

  LocationLoaded(this.locations);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}

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
