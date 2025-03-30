import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/Concurrent.dart' show Brands;

part 'ApiService.g.dart';

@RestApi(baseUrl: 'https://server-hakaton.stage01.cyber-rush.top')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/api/vk/group/find')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Custom-Header': 'Your header',
  })
  Future<List<Brands>> getBrands(@Query('url') String url);
}
