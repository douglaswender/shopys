import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopys/app/core/error/exceptions.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';
import 'package:shopys/app/features/home/data/repositories/product_repository_impl.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([IProductDataSource])
main() {
  late ProductRepositoryImpl repository;
  late IProductDataSource dataSource;

  setUp(() {
    dataSource = MockIProductDataSource();
    repository = ProductRepositoryImpl(dataSource);
  });

  final tProductModelList = [
    ProductModel(description: "description", name: "name", photoUrl: "photoUrl"),
    ProductModel(description: "description", name: "name", photoUrl: "photoUrl"),
  ];

  test("should return a list of productModel when calls repository", () async {
    when(dataSource.getProductList()).thenAnswer((_) async => tProductModelList);

    final result = await repository.getProductList();

    expect(result.isRight(), true);
  });

  test("should return a server failure when calls repository", () async {
    when(dataSource.getProductList()).thenThrow(ServerException());

    final result = await repository.getProductList();

    expect(result, Left(ServerFailure()));
  });
}
