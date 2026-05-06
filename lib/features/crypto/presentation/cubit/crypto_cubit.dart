import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/crypto_repository.dart';

import 'crypto_state.dart';

class CryptoCubit
    extends Cubit<CryptoState> {

  final CryptoRepository
      repository;

  CryptoCubit(
    this.repository,
  ) : super(
          CryptoInitial(),
        );


  Future<void>
      fetchCoins() async {

    try {

      emit(
        CryptoLoading(),
      );

      final coins =
          await repository
              .fetchCoins();

      emit(
        CryptoLoaded(
          coins,
        ),
      );

    } catch (e) {

      emit(
        CryptoError(
          e.toString(),
        ),
      );
    }
  }
}