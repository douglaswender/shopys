import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopys/app/core/endpoints/shopys_endpoints.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource_impl.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';

import 'product_datasource_impl_test.mocks.dart';

@GenerateMocks([HttpClient])
main() {
  late IProductDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = ProductDataSource(client);
  });

  final productListMock = '''[
    {
      "description": "description",
      "name": "name",
      "photoUrl": "photoUrl"
    },
    {
      "description": "description",
      "name": "name",
      "photoUrl": "photoUrl"
    }
  ]''';

  void whenSucess() => when(client.get(ShopysEndpoints.productList))
      .thenAnswer((_) async => HttpResponse(data: productListMock, statusCode: 200));

  test('should call the get method with correct url', () async {
    whenSucess();

    await dataSource.getProductList();

    verify(client.get(ShopysEndpoints.productList)).called(1);
  });

  test("should return a list of productModel when is success", () async {
    whenSucess();

    final response = await dataSource.getProductList();

    expect(response, isA<List<ProductModel>>());
  });

  test("should throw when is failure", () async {
    when(client.get(ShopysEndpoints.productList))
        .thenAnswer((_) async => HttpResponse(statusCode: 400, data: 'something went wrong'));

    final response = dataSource.getProductList();

    expect(() => response, throwsA(ServerFailure()));
  });
}
