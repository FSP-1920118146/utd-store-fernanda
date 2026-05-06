import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';

import '../cubit/crypto_cubit.dart';
import '../cubit/crypto_state.dart';


class CryptoPage
    extends StatelessWidget {

  const CryptoPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {

    return BlocProvider(

      create: (_) =>
          sl<CryptoCubit>()
            ..fetchCoins(),

      child: Scaffold(

        appBar: AppBar(
          title: const Text(
            'Crypto Hub',
          ),
        ),

        body: BlocBuilder<
            CryptoCubit,
            CryptoState>(

          builder: (
            context,
            state,
          ) {

            // LOADING
            if (state
                is CryptoLoading) {

              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }


            // SUCCESS
            if (state
                is CryptoLoaded) {

              return ListView.builder(

                itemCount:
                    state.coins.length,

                itemBuilder: (
                  context,
                  index,
                ) {

                  final coin =
                      state.coins[index];

                  return Card(

                    margin:
                        const EdgeInsets.all(
                      8,
                    ),

                    child: ListTile(

                      title: Text(
                        coin.name,
                      ),

                      subtitle: Text(
                        '\$${coin.price}',
                      ),

                      trailing:
                          const Icon(
                        Icons.currency_bitcoin,
                      ),
                    ),
                  );
                },
              );
            }


            // ERROR
            if (state
                is CryptoError) {

              return Center(
                child: Text(
                  state.message,
                ),
              );
            }


            return const SizedBox();
          },
        ),
      ),
    );
  }
}