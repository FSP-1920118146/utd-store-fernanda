import '../../domain/entities/coin.dart';

abstract class CryptoState {}

class CryptoInitial
    extends CryptoState {}

class CryptoLoading
    extends CryptoState {}

class CryptoLoaded
    extends CryptoState {

  final List<Coin> coins;

  CryptoLoaded(
    this.coins,
  );
}

class CryptoError
    extends CryptoState {

  final String message;

  CryptoError(
    this.message,
  );
}