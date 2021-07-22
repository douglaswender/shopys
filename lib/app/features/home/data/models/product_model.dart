import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String name,
    required String description,
    required String photoUrl,
  }) : super(
          description: description,
          name: name,
          photoUrl: photoUrl,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        description: json['description'],
        name: json['name'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'name': name,
        'photoUrl': photoUrl,
      };
}
