import 'dart:convert';

import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';

//TODO: Realizar testes unitários
class ProductLocalDataSource implements IProductDataSource {
  final HttpClient client;

  ProductLocalDataSource(
    this.client,
  );

  @override
  Future<List<ProductModel>> getProductList() async {
    String mockData = '''
      [
        {
          "description": "description",
          "name": "name",
          "photoUrl": "photoUrl",
          "price": 5000
        },
        {
          "description": "description",
          "name": "name",
          "photoUrl": "photoUrl"
          "price": 5000
        },
        {
          "description": "description",
          "name": "name",
          "photoUrl": "photoUrl"
          "price": 5000
        }  
      ]
    ''';

    final response = HttpResponse(data: mockData, statusCode: 200);
    if (response.statusCode == 200) {
      return (json.decode(response.data) as List).map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerFailure();
    }
  }
}
