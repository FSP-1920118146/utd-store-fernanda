import '../../domain/entities/coin.dart';
import '../../domain/repositories/crypto_repository.dart';

import '../datasources/crypto_remote_datasource.dart';

class CryptoRepositoryImpl
    implements CryptoRepository {

  final CryptoRemoteDataSource
      remoteDataSource;

  CryptoRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Coin>>
      fetchCoins() async {

    return await remoteDataSource
        .fetchCoins();
  }
}