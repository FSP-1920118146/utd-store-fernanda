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


import '../../features/crypto/data/datasources/crypto_remote_datasource.dart';
import '../../features/crypto/data/datasources/crypto_remote_datasource_impl.dart';

import '../../features/crypto/domain/repositories/crypto_repository.dart';
import '../../features/crypto/data/repositories/crypto_repository_impl.dart';

import '../../features/crypto/presentation/cubit/crypto_cubit.dart';


final sl = GetIt.instance;


Future<void> initDependencies({
  bool webMode = false,
}) async {

  const nimLastDigit = 9;


  // SPLASH
  sl.registerLazySingleton<SplashService>(
    () => SplashServiceImpl(
      nimLastDigit,
    ),
  );


  // DIO
  sl.registerLazySingleton<Dio>(
    () => DioClient.create(),
  );


  // PRODUCT DATASOURCE
  sl.registerLazySingleton<
      ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      sl<Dio>(),
    ),
  );


  // PRODUCT REPOSITORY
  sl.registerLazySingleton<
      ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource:
          sl<ProductRemoteDataSource>(),

      nimLastDigit:
          nimLastDigit,
    ),
  );


  // PRODUCT CUBIT
  sl.registerFactory(
    () => ProductCubit(
      sl<ProductRepository>(),
    ),
  );


  // CRYPTO DATASOURCE
  sl.registerLazySingleton<
      CryptoRemoteDataSource>(
    () => CryptoRemoteDataSourceImpl(
      sl<Dio>(),
    ),
  );


  // CRYPTO REPOSITORY
  sl.registerLazySingleton<
      CryptoRepository>(
    () => CryptoRepositoryImpl(
      remoteDataSource:
          sl<CryptoRemoteDataSource>(),
    ),
  );


  // CRYPTO CUBIT
  sl.registerFactory(
    () => CryptoCubit(
      sl<CryptoRepository>(),
    ),
  );
}