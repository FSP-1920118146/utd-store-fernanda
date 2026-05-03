import '../../domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
}