import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (_) =>
          sl<ProductCubit>()
            ..fetchProducts(),

      child: Scaffold(

        appBar: AppBar(
          title: const Text(
            'UTD Store',
          ),
        ),

        body: BlocBuilder<
            ProductCubit,
            ProductState>(

          builder: (
            context,
            state,
          ) {

            // LOADING
            if (state
                is ProductLoading) {

              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }


            // SUCCESS
            if (state
                is ProductLoaded) {

              return ListView.builder(

                itemCount:
                    state.products.length,

                itemBuilder: (
                  context,
                  index,
                ) {

                  final product =
                      state.products[index];

                  return Card(

                    margin:
                        const EdgeInsets.all(
                      8,
                    ),

                    child: ListTile(

                      contentPadding:
                          const EdgeInsets.all(
                        12,
                      ),

                      title: Text(
                        product.title,
                      ),

                      subtitle: Text(
                        '\$${product.price}',
                      ),

                      trailing:
                          const Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                  );
                },
              );
            }


            // ERROR
            if (state
                is ProductError) {

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