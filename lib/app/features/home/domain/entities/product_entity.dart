import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final String photoUrl;

  ProductEntity({
    required this.name,
    required this.description,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        photoUrl,
      ];
}
