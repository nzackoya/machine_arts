import 'package:json/json.dart';

@JsonCodable()
class BrandDetails {
  String brandDetailsId;
  String brandId;
  String? searchRequestId;
  String details;
  String url;
  DateTime createdAt;
}

@JsonCodable()
class Brands {
  String brandId;
  String name;
  DateTime createdAt;
  List<BrandDetails> brandDetails;
  List<BrandAddress> brandAddress;
}

@JsonCodable()
class BrandAddress {
  String brandAddressId;
  String brandId;
  String? brandDetailsId;
  String? country;
  String? city;
  String? street;
  int? house;
  int? apportionment;
  double? latitude;
  double? longitude;
  String? details;
}
