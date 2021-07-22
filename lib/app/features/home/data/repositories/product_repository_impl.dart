import 'package:shopys/app/core/error/exceptions.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shopys/app/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() async {
    try {
      final result = await dataSource.getProductList();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
