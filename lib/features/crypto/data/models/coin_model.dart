import '../../domain/entities/coin.dart';

class CoinModel extends Coin {

  const CoinModel({
    required super.name,
    required super.price,
  });


  factory CoinModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return CoinModel(

      name:
          json['name'],

      price:
          (json['current_price'] as num)
              .toDouble(),
    );
  }
}