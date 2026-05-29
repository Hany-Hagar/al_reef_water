import 'package:osm_search_and_pick/open_street_map_search_and_pick.dart';

extension KsaDeliveryAddressFormatter on PickedData {
  String toKsaDeliveryAddress({
    String? buildingNumber,
    String? unitNumber,
    String? additionalDetails,
  }) {
    final addressMap = address;

    final String? street = addressMap['road'] ?? addressMap['street'];
    final String? district =
        addressMap['suburb'] ??
        addressMap['neighbourhood'] ??
        addressMap['quarter']; 
    final String? city =
        addressMap['city'] ??
        addressMap['town'] ??
        addressMap['village']; 
    final String? region =
        addressMap['state'] ??
        addressMap['province']; 
    final String? postcode =
        addressMap['postcode']; 

    final List<String> addressParts = [];

    if (buildingNumber != null && buildingNumber.trim().isNotEmpty) {
      String unitStr = (unitNumber != null && unitNumber.trim().isNotEmpty)
          ? 'شقة ${unitNumber.trim()}، '
          : '';
      addressParts.add('$unitStrمبنى رقم ${buildingNumber.trim()}');
    }

    if (street != null && street.toString().trim().isNotEmpty) {
      addressParts.add('شارع ${street.toString().trim()}');
    }
    if (district != null && district.toString().trim().isNotEmpty) {
      addressParts.add('حي ${district.toString().trim()}');
    }

    if (city != null && city.toString().trim().isNotEmpty) {
      addressParts.add(city.toString().trim());
    }
    if (region != null && region.toString().trim().isNotEmpty) {
      addressParts.add(region.toString().trim());
    }
    if (postcode != null && postcode.toString().trim().isNotEmpty) {
      addressParts.add('الرمز البريدي ${postcode.toString().trim()}');
    }

    String formattedMapAddress = addressParts.join('، ');

    if (formattedMapAddress.isEmpty) {
      formattedMapAddress = addressName;
    }

    if (additionalDetails != null && additionalDetails.trim().isNotEmpty) {
      formattedMapAddress += ' - (ملاحظات: ${additionalDetails.trim()})';
    }

    return formattedMapAddress;
  }
}
