import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/usecase/usecase.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/home/domain/usecases/get_product_list_usecase.dart';
import 'package:shopys/app/features/home/presentation/home_store.dart';

import 'home_store_test.mocks.dart';

@GenerateMocks([GetProductListUsecase])
main() {
  late HomeStore homeStore;
  late GetProductListUsecase usecase;

  setUp(() {
    usecase = MockGetProductListUsecase();
    homeStore = HomeStore(usecase);
  });

  final productListMock = [
    ProductEntity(
      name: 'name',
      description: 'description',
      photoUrl: 'photoUrl',
      price: 1000,
    ),
    ProductEntity(
      name: 'name',
      description: 'description',
      photoUrl: 'photoUrl',
      price: 1000,
    ),
  ];

  final noParams = NoParams();

  test("should return a list of ProductEntity from the usecase", () {
    when(usecase(noParams)).thenAnswer((_) async => Right(productListMock));

    homeStore.getProductListUsecase(noParams);

    homeStore.observer(onState: (state) {
      expect(state, productListMock);
      verify(usecase(noParams)).called(1);
    });
  });

  test("should return a failure from the usecase", () {
    when(usecase(noParams)).thenAnswer((_) async => Left(ServerFailure()));

    homeStore.getProductListUsecase(noParams);

    homeStore.observer(onError: (error) {
      expect(error, ServerFailure());
      verify(usecase(noParams)).called(1);
    });
  });
}
