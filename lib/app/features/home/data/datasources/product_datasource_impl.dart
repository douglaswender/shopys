import 'dart:convert';

import 'package:shopys/app/core/endpoints/shopys_endpoints.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';

class ProductDataSource implements IProductDataSource {
  final HttpClient client;

  ProductDataSource(
    this.client,
  );

  @override
  Future<List<ProductModel>> getProductList() async {
    final response = await client.get(ShopysEndpoints.productList);

    if (response.statusCode == 200) {
      return (json.decode(response.data) as List).map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerFailure();
    }
  }
}
