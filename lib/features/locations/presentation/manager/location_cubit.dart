// ignore_for_file: strict_top_level_inference

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/location_model.dart';
import '../../data/repo/location_repo.dart';
import 'location_states.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepo;
  LocationCubit({required this.locationRepo}) : super(LocationInitialState());

  static LocationCubit get(context) => BlocProvider.of(context);

  List<LocationModel> locations = [];

  Future<void> fetchLocations() async {
    emit(LocationLoading());
    var result = await locationRepo.getLocations();
    result.fold((failure) => emit(LocationError(failure.message)), (locs) {
      locations = locs;
      emit(LocationLoaded(locations));
    });
  }

  Future<void> addLocation(LocationModel location) async {
    emit(AddLocationLoading());
    var result = await locationRepo.addLocation(location);
    result.fold((failure) => emit(LocationError(failure.message)), (
      newLocation,
    ) {
      locations.add(newLocation);
      emit(AddLocationSuccess(newLocation));
    });
  }

  Future<void> updateLocation(String id, LocationModel location) async {
    emit(UpdateLocationLoading());
    var result = await locationRepo.updateLocation(id, location);
    result.fold((failure) => emit(LocationError(failure.message)), (
      updatedLocation,
    ) {
      int index = locations.indexWhere((loc) => loc.id == id);
      if (index != -1) {
        locations[index] = updatedLocation;
        emit(UpdateLocationSuccess(updatedLocation));
      }
    });
  }

  Future<void> deleteLocation(String id) async {
    emit(DeleteLocationLoading());
    var result = await locationRepo.deleteLocation(id);
    result.fold((failure) => emit(LocationError(failure.message)), (success) {
      if (success) {
        locations.removeWhere((loc) => loc.id == id);
        emit(DeleteLocationSuccess(id));
      }
    });
  }
}
