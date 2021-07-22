import 'package:dartz/dartz.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';

abstract class IProductDataSource {
  //Future<Either<Failure, List<ProductModel>>> getProductList();
  Future<List<ProductModel>> getProductList();
}
