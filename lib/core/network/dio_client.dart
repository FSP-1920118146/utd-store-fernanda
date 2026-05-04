import 'package:dio/dio.dart';

class DioClient {

  static Dio create() {

    final dio = Dio();


    dio.interceptors.add(

      InterceptorsWrapper(

        onRequest: (
          options,
          handler,
        ) {

          print(
            'REQUEST => ${options.method} ${options.path}',
          );

          handler.next(
            options,
          );
        },


        onResponse: (
          response,
          handler,
        ) {

          print(
            'RESPONSE => ${response.statusCode}',
          );

          handler.next(
            response,
          );
        },


        onError: (
          error,
          handler,
        ) {

          print(
            'ERROR => ${error.message}',
          );

          handler.next(
            error,
          );
        },
      ),
    );


    return dio;
  }
}