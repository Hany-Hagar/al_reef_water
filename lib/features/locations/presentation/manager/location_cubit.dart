// ignore_for_file: strict_top_level_inference
import 'dart:developer';

import 'location_states.dart';
import 'package:flutter/material.dart';
import '../../data/models/city_model.dart';
import '../../data/repo/location_repo.dart';
import '../../data/models/region_model.dart';
import '../../data/models/location_model.dart';
import '../../data/models/district_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osm_search_and_pick/models/picked_data.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepo;
  LocationCubit({required this.locationRepo}) : super(LocationInitialState());

  static LocationCubit get(context) => BlocProvider.of(context);

  List<RegionModel> regions = [];
  List<LocationModel> locations = [];

  RegionModel? selectedRegion;
  CityModel? selectedCity;
  DistrictModel? selectedDistrict;

  var titleController = TextEditingController();
  var countryController = TextEditingController();
  var streetController = TextEditingController();
  var buildingNumberController = TextEditingController();
  var floorController = TextEditingController();

  String editId = "";
  String deleteId = "";

  Future<void> loadRegions() async {
    emit(RegionLoading());
    var result = await locationRepo.loadRegions();
    result.fold((failure) => emit(RegionError(failure.message)), (data) {
      regions = data;
      emit(RegionLoaded());
    });
  }

  Future<void> fetchLocations() async {
    emit(LocationLoading());
    var result = await locationRepo.getLocations();
    result.fold((failure) => emit(LocationError(failure.message)), (locs) {
      locations = locs;
      emit(LocationLoaded(locations));
    });
  }

  void setControllers(LocationModel location) {
    editId = location.id;
    titleController.text = location.name;
    countryController.text = location.country;
    streetController.text = location.street;
    buildingNumberController.text = location.buildingNumber;
    floorController.text = location.floor.toString();

    selectedRegion = regions.firstWhere(
      (region) => region.names.last == location.region,
      orElse: () => regions.first,
    );

    selectedCity = selectedRegion?.cities.firstWhere(
      (city) => city.names.last == location.city,
      orElse: () => selectedRegion!.cities.first,
    );
    selectedDistrict = selectedCity?.districts.firstWhere(
      (district) => district.names.last == location.district,
      orElse: () => selectedCity!.districts.first,
    );
  }

  void clearControllers() {
    editId = "";
    selectedRegion = regions.isNotEmpty ? regions.first : null;
    selectedCity = selectedRegion?.cities.isNotEmpty == true
        ? selectedRegion!.cities.first
        : null;
    selectedDistrict = selectedCity?.districts.isNotEmpty == true
        ? selectedCity!.districts.first
        : null;
    titleController.clear();
    streetController.clear();
    buildingNumberController.clear();
    floorController = TextEditingController(text: "1");
  }

Future<void> setLocationData({required PickedData pickedData}) async {
    clearControllers();

    String fullAddress = pickedData.addressName;
    String buildingNumber = pickedData.address['house_number'] ?? 
                            pickedData.address['building'] ?? 
                            ""; 

    String roadName = pickedData.address['road'] ?? 
                      pickedData.address['street'] ?? 
                      "";

    if (roadName.isEmpty) {
      roadName = pickedData.address['amenity'] ?? 
                 pickedData.address['hotel'] ?? 
                 "";
    }
    if (roadName.isEmpty && fullAddress.isNotEmpty) {
      roadName = fullAddress.split(',').first.trim();
    }

    String districtName = pickedData.address['neighbourhood'] ?? 
                         pickedData.address['suburb'] ?? 
                         "";
                         
    String cityName = pickedData.address['city'] ?? 
                      pickedData.address['town'] ?? 
                      "";

    var location = LocationModel.fromOSM(
      title: "",
      floor: 1,
      pickedData: pickedData,
    );


    log("RAW DATA: $pickedData");
    log("MAP DATA: ${pickedData.address}");
    log("FULL ADDRESS: $fullAddress");
    log("BUILDING: $buildingNumber");
    log("STREET: $roadName");
    log("DISTRICT: $districtName");
    log("CITY: $cityName");
    
    setControllers(location);
}


  void onRegionSelected(RegionModel region) {
    selectedRegion = region;
    selectedCity = selectedRegion?.cities.first;
    selectedDistrict = selectedCity?.districts.first;
    emit(RegionSelected());
  }

  void onCitySelected(CityModel city) {
    selectedCity = city;
    selectedDistrict = selectedCity?.districts.first;
    emit(CitySelected());
  }

  void onDistrictSelected(DistrictModel district) {
    selectedDistrict = district;
    emit(DistrictSelected());
  }

  LocationModel getLocationFromInput() {
    return LocationModel(
      id: "",
      name: titleController.text,
      country: countryController.text,
      region: selectedRegion?.names.last ?? '',
      city: selectedCity?.names.last ?? '',
      district: selectedDistrict?.names.last ?? '',
      street: streetController.text,
      buildingNumber: buildingNumberController.text,
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
