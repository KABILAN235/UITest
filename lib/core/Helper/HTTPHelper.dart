abstract class HttpHelper {
  Future<HttpResponse> get({required String url});
}

class HttpResponse {
  HttpResponse({required this.statusCode, required this.data});

  final int statusCode;
  final List data;

  bool get isOk => statusCode >= 200 && statusCode <= 304;
}
