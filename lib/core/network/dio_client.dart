import 'package:dio/dio.dart';

class DioClient {

  static Dio create() {

    final dio = Dio();

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}