import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final String photoUrl;
  final int price;

  ProductEntity({
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.price,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        photoUrl,
        price,
      ];
}
