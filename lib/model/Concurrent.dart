import 'package:json/json.dart';

@JsonCodable()
class Brands {
  String? brand_details_id;
  String? brand_id;
  String? platform;
  String? details;
  String? url;
  AdditionInfo? addition_info;
  DateTime? created_at;
  String? search_request_id;
}

@JsonCodable()
class AdditionInfo {
  int? id;
  String? name;
  String? site;
  String? type;
  Cover? cover;
  String? status;
  String? activity;
  int? is_admin;
  String? photo_50;
  int? verified;
  Addresses? addresses;
  int? is_closed;
  int? is_member;
  String? photo_100;
  String? photo_200;
  String? description;
  String? screen_name;
  int? is_advertiser;
  int? members_count;
}

@JsonCodable()
class Addresses {
  int? count;
  bool? is_enabled;
  MainAddress? main_address;
  int? main_address_id;
}

@JsonCodable()
class City {
  int? id;
  String? title;
}

@JsonCodable()
class Country {
  int? id;
  String? title;
}

@JsonCodable()
class Cover {
  List<Image?>? images;
  int? enabled;
}

@JsonCodable()
class Image {
  String? url;
  int? width;
  int? height;
}

@JsonCodable()
class MainAddress {
  int? id;
  City? city;
  String? title;
  String? address;
  Country? country;
  String? work_info_status;
  String? additional_address;
}
