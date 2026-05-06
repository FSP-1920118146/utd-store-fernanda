import 'package:dio/dio.dart';

import 'crypto_remote_datasource.dart';
import '../models/coin_model.dart';

class CryptoRemoteDataSourceImpl
    implements CryptoRemoteDataSource {

  final Dio dio;

  CryptoRemoteDataSourceImpl(
    this.dio,
  );

  @override
  Future<List<CoinModel>>
      fetchCoins() async {

    final response =
        await dio.get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {

        'vs_currency':
            'usd',

        'per_page':
            10,

        'page':
            1,
      },
    );


    final data =
        response.data as List;


    return data
        .map(
          (json) =>
              CoinModel.fromJson(
            json,
          ),
        )
        .toList();
  }
}