import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl
    implements ProductRepository {

  final ProductRemoteDataSource remoteDataSource;

  final int nimLastDigit;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.nimLastDigit,
  });

  @override
  Future<List<Product>> getProducts() async {

    final products =
        await remoteDataSource.getProducts();

    final suffix =
        nimLastDigit.isOdd
            ? '[Diskon 10%]'
            : '[Promo Ongkir]';

    return products.map((product) {

      return Product(
        id: product.id,
        title:
            '${product.title} $suffix',
        price: product.price,
      );

    }).toList();
  }
}