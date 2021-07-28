abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, Map<String, dynamic> json);
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({
    required this.data,
    this.statusCode,
  });
}
