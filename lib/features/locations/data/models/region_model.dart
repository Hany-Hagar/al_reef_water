import 'city_model.dart';

class RegionModel {
  final int regionId;
  final List<String> names; 
  final List<CityModel> cities;

  RegionModel({
    required this.regionId,
    required this.names,
    required this.cities,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    var citiesList = json['cities'] as List;
    List<CityModel> cityObjects = citiesList.map((c) => CityModel.fromJson(c)).toList();

    return RegionModel(
      regionId: json['region_id'],
      names: [json['region_name_en'].toString(), json['region_name_ar'].toString()],
      cities: cityObjects,
    );
  }
}

