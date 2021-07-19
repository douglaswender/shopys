import 'package:dartz/dartz.dart';

import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/usecase/usecase.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/home/domain/repositories/product_repository.dart';

class GetProductListUsecase implements UseCase<List<ProductEntity>, NoParams> {
  final IProductRepository repository;

  GetProductListUsecase(
    this.repository,
  );

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.getProductList();
  }
}
