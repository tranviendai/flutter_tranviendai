import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API{
  final Dio _dio = Dio();
  String baseUrl = "https://raw.githubusercontent.com/GoldenOwlAsia/webdev-intern-assignment/main/app/data/";
  API(){
    _dio.options.baseUrl = baseUrl;
    // _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}