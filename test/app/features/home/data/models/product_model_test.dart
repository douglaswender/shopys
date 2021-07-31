import 'package:flutter_test/flutter_test.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

main() {
  final tProductModel = ProductModel(
    description: "description",
    name: "name",
    photoUrl: "photoUrl",
    price: 1000,
  );

  final productMock = {
    "description": "description",
    "name": "name",
    "photoUrl": "photoUrl",
    "price": 1000
  };
  test("should be a subclass of ProductEntity", () {
    expect(tProductModel, isA<ProductEntity>());
  });

  test("should return a valid model", () {
    final result = ProductModel.fromJson(productMock);

    expect(result, tProductModel);
  });

  test("should return a json map containing the proper data", () {
    final result = tProductModel.toJson();

    expect(result, productMock);
  });
}
