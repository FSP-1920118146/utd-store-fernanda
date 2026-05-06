import '../entities/coin.dart';

abstract class CryptoRepository {

  Future<List<Coin>>
      fetchCoins();
}