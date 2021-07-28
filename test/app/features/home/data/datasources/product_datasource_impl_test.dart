import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource_impl.dart';

import 'product_datasource_impl_test.mocks.dart';

@GenerateMocks([HttpClient])
main() {
  late IProductDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = ProductDataSource(client);
  });

  final productMock = {
    "description": "description",
    "name": "name",
    "photoUrl": "photoUrl",
  };

  final url = "https://api.test.com/products";

  test('should call the get method with correct url', () async {
    when(client.get('test')).thenAnswer((_) async => HttpResponse(data: productMock));

    final result = await dataSource.getProductList();

    verify(() => client.get(url));
  });
}
