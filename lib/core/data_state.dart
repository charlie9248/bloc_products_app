import 'package:dio/dio.dart';

abstract class DataState<T> {

  final T? data;
  final DioException? error;

  const DataState({this.data , this.error});
}


class DataSuccess<T>  extends DataState<T> {

  DataSuccess(T data) : super(data:  data);
}

class DataFailure<T> extends DataState<T> {

  DataFailure(DioException error) : super(error: error);
}