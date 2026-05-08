import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';


class ProductPage
    extends StatelessWidget {

  const ProductPage({
    super.key,
  });


  @override
  Widget build(
    BuildContext context,
  ) {

    return BlocProvider(

      create: (_) =>
          sl<ProductCubit>()
            ..fetchProducts(),

      child: Scaffold(

        appBar: AppBar(

          title: const Text(
            'UTD Store',
          ),

          actions: [

            // CRYPTO
            IconButton(

              onPressed: () {

                context.go(
                  '/crypto',
                );
              },

              icon: const Icon(
                Icons.currency_bitcoin,
              ),
            ),


            // ISOLATE
            IconButton(

              onPressed: () {

                context.go(
                  '/isolate',
                );
              },

              icon: const Icon(
                Icons.science,
              ),
            ),


            // BATTERY
            IconButton(

              onPressed: () {

                context.go(
                  '/battery',
                );
              },

              icon: const Icon(
                Icons.battery_full,
              ),
            ),
          ],
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


                      leading:
                          Image.network(

                        product.image,

                        width: 60,

                        errorBuilder: (

                          context,
                          error,
                          stackTrace,

                        ) {

                          return const Icon(
                            Icons.image,
                          );
                        },
                      ),


                      title: Text(
                        product.title,
                      ),


                      subtitle: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            product.category,
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          Text(

                            '\$${product.price}',

                            style:
                                const TextStyle(

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
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