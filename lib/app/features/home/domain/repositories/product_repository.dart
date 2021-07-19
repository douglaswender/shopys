import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();
}
