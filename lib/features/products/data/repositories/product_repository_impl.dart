import '../../domain/entities/product.dart';

import '../../domain/repositories/product_repository.dart';

import '../datasources/product_remote_datasource.dart';


class ProductRepositoryImpl
    implements ProductRepository {

  final ProductRemoteDataSource
      remoteDataSource;

  final int
      nimLastDigit;


  ProductRepositoryImpl({

    required this.remoteDataSource,

    required this.nimLastDigit,
  });


  @override
  Future<List<Product>>
      getProducts() async {

    final products =
        await remoteDataSource
            .getProducts();


    return products.map((item) {

      return Product(

        id:
            item.id,

        title:
            item.title,

        price:
            item.price,

        image:
            item.image,

        category:
            item.category,
      );

    }).toList();
  }
}