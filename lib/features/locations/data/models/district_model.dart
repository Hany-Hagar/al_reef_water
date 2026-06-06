class DistrictModel {
  final int districtId;
  final List<String> names;

  DistrictModel({required this.districtId, required this.names});

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      districtId: json['district_id'],
      names: [json['name_en'].toString(), json['name_ar'].toString()],
    );
  }
}
