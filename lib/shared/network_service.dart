import 'package:dio/dio.dart';

abstract class NetworkService {

  Future<Response> get(
      String endPoint, {
        Map<String, String>? headers,
        Map<String, dynamic>? queryParams,
      });

  // Future<Response> post(String endPoint,
  //     { Map<String, String>? headers,
  //       Map<String, dynamic>? data});
}
