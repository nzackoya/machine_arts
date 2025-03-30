import 'package:json/json.dart';

@JsonCodable()
class Bloggers {
  List<Blogger> bloggers;
}

@JsonCodable()
class Blogger {
  String name;
  String type;
  String subscribers;
  String description;
  String bio;
  String photo_url;
}
