import 'package:dio/dio.dart';
import 'package:products_app/constants/string_const.dart';

import 'network_service.dart';

class DioNetworkService extends NetworkService {

  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    dio.options = dioBaseOptions;
    dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

  }

  BaseOptions get dioBaseOptions => BaseOptions(
      baseUrl: AppConst.baseUrl,
      headers: AppConst.headers,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));


  @override
  Future<Response> get(String endPoint, {Map<String, String>? headers, Map<String, dynamic>? queryParams}) {
    try{
      var response  = dio.get(endPoint);
      return response;
    }
    catch(e){
      rethrow;
    }
  }

  // @override
  // Future<Response> post(String endPoint, {Map<String, String>? headers, Map<String, dynamic>? data}) {
  //   throw UnimplementedError();
  // }

}