import 'package:shopys/app/features/home/data/models/product_model.dart';

abstract class IProductDataSource {
  //Future<Either<Failure, List<ProductModel>>> getProductList();
  Future<List<ProductModel>> getProductList();
}
