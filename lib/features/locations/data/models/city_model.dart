import 'district_model.dart';

class CityModel {
  final int cityId;
  final List<String> names;
  final List<DistrictModel> districts;

  CityModel({
    required this.cityId,
    required this.names,
    required this.districts,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    var districtsList = json['districts'] as List;
    List<DistrictModel> districtObjects = districtsList.map((d) => DistrictModel.fromJson(d)).toList();

    return CityModel(
      cityId: json['city_id'],
      names: [json['city_name_en'].toString(), json['city_name_ar'].toString()],
      districts: districtObjects,
    );
  }
}


