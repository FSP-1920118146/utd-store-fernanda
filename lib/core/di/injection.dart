import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_client.dart';

import '../../features/splash/domain/services/splash_service.dart';
import '../../features/splash/data/services/splash_service_impl.dart';

import '../../features/products/data/datasources/product_remote_datasource.dart';
import '../../features/products/data/datasources/product_remote_datasource_impl.dart';

import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';

import '../../features/products/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  const nimLastDigit = 9;


  // SPLASH
  sl.registerLazySingleton<
      SplashService>(

    () => SplashServiceImpl(
      nimLastDigit,
    ),
  );


  // DIO
  sl.registerLazySingleton<
      Dio>(

    () => DioClient.create(),
  );


  // DATASOURCE
  sl.registerLazySingleton<
      ProductRemoteDataSource>(

    () =>
        ProductRemoteDataSourceImpl(
      sl<Dio>(),
    ),
  );


  // REPOSITORY
  sl.registerLazySingleton<
      ProductRepository>(

    () =>
        ProductRepositoryImpl(

      remoteDataSource:
          sl<ProductRemoteDataSource>(),

      nimLastDigit:
          nimLastDigit,
    ),
  );


  // CUBIT
  sl.registerFactory<
      ProductCubit>(

    () => ProductCubit(
      sl<ProductRepository>(),
    ),
  );
}