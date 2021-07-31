import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class HttpClientImpl implements HttpClient {
  final client = Dio();
  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(url);

    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic> json) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
