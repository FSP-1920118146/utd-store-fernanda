import '../../domain/entities/product.dart';

class ProductModel
    extends Product {

  ProductModel({

    required int id,
    required String title,
    required double price,
    required String image,
    required String category,

  }) : super(

          id: id,
          title: title,
          price: price,
          image: image,
          category: category,
        );


  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProductModel(

      id:
          json['id'],

      title:
          json['title'],

      price:
          (json['price'] as num)
              .toDouble(),

      image:
          json['image'],

      category:
          json['category'],
    );
  }
}