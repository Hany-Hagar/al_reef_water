// ignore_for_file: strict_top_level_inference

import 'location_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/location_repo.dart';
import '../../data/models/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepo;
  LocationCubit({required this.locationRepo}) : super(LocationInitialState());

  static LocationCubit get(context) => BlocProvider.of(context);

  List<LocationModel> locations = [];

  var titleController = TextEditingController();
  var countryController = TextEditingController();
  var regionController = TextEditingController();
  var cityController = TextEditingController();
  var districtController = TextEditingController();
  var streetController = TextEditingController();
  var buildingNumberController = TextEditingController();
  var floorController = TextEditingController(text: "1");
  var apartmentNumberController = TextEditingController(text: "1");

  String editId = "";
  String deleteId = "";

  Future<void> fetchLocations() async {
    emit(LocationLoading());
    var result = await locationRepo.getLocations();
    result.fold((failure) => emit(LocationError(failure.message)), (locs) {
      locations = locs;
      emit(LocationLoaded(locations));
    });
  }

  void setControllers({
    required bool isEditing,
    required LocationModel location,
  }) {
    if (isEditing) editId = location.id;
    titleController.text = location.name;
    countryController.text = location.country;
    regionController.text = location.region;
    cityController.text = location.city;
    districtController.text = location.district;
    streetController.text = location.street;
    buildingNumberController.text = location.buildingNumber;
    floorController.text = location.floor.toString();
    apartmentNumberController.text = location.apartmentNumber;
  }

  void clearControllers() {
    editId = "";
    titleController.clear();
    countryController.clear();
    regionController.clear();
    cityController.clear();
    districtController.clear();
    streetController.clear();
    buildingNumberController.clear();
    floorController.text = "1";
    apartmentNumberController.text = "1";
  }

  LocationModel getLocationFromInput() {
    return LocationModel(
      id: "",
      name: titleController.text,
      country: countryController.text,
      region: regionController.text,
      city: cityController.text,
      district: districtController.text,
      street: streetController.text,
      buildingNumber: buildingNumberController.text,
      apartmentNumber: apartmentNumberController.text,
      floor: int.tryParse(floorController.text) ?? 0,
    );
  }

  Future<void> addLocation({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(AddLocationLoading());
    var result = await locationRepo.addLocation(getLocationFromInput());
    result.fold((failure) => emit(LocationError(failure.message)), (
      newLocation,
    ) {
      locations.add(newLocation);
      clearControllers();
      emit(AddLocationSuccess(newLocation));
    });
  }

  Future<void> updateLocation({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(UpdateLocationLoading());
    var result = await locationRepo.updateLocation(
      editId,
      getLocationFromInput(),
    );
    result.fold((failure) => emit(LocationError(failure.message)), (
      updatedLocation,
    ) {
      int index = locations.indexWhere((loc) => loc.id == editId);
      if (index != -1) {
        locations[index] = updatedLocation;
        emit(UpdateLocationSuccess(updatedLocation));
      }
    });
  }

  Future<void> deleteLocation(String id) async {
    deleteId = id;
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
