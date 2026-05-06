import '../models/coin_model.dart';

abstract class CryptoRemoteDataSource {

  Future<List<CoinModel>>
      fetchCoins();
}