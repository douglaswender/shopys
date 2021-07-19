import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopys/app/core/usecase/usecase.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/home/domain/repositories/product_repository.dart';
import 'package:shopys/app/features/home/domain/usecases/get_product_list_usecase.dart';

import 'get_product_list_usecase_test.mocks.dart';

@GenerateMocks([IProductRepository])
main() {
  late GetProductListUsecase usecase;
  late IProductRepository repository;

  setUp(() {
    repository = MockIProductRepository();
    usecase = GetProductListUsecase(repository);
  });

  test("get product list of ProductEntity - success", () async {
    final lNoParams = NoParams();
    final tList = [
      ProductEntity(name: 'name', description: 'description', photoUrl: 'photoUrl'),
      ProductEntity(name: 'name', description: 'description', photoUrl: 'photoUrl'),
      ProductEntity(name: 'name', description: 'description', photoUrl: 'photoUrl'),
    ];
    when(repository.getProductList()).thenAnswer((_) => Future.value(Right(tList)));

    final result = await usecase(lNoParams);

    expect(result, Right(tList));
  });
}
