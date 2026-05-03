import 'package:dio/dio.dart';

import '../models/product_model.dart';
import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl
    implements ProductRemoteDataSource {

  final Dio dio;

  ProductRemoteDataSourceImpl(
    this.dio,
  );

  @override
  Future<List<ProductModel>> getProducts() async {

    final response = await dio.get(
      'https://fakestoreapi.com/products',
    );

    final data = response.data as List;

    return data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
  }
}