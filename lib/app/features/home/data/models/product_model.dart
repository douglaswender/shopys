import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String name,
    required String description,
    required String photoUrl,
    required int price,
  }) : super(
          description: description,
          name: name,
          photoUrl: photoUrl,
          price: price,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        description: json['description'],
        name: json['name'],
        photoUrl: json['photoUrl'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'name': name,
        'photoUrl': photoUrl,
        'price': price,
      };
}
