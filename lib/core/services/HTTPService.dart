import 'package:demo/core/Helper/HTTPHelper.dart';
import 'package:demo/core/services/MockService.dart';

class HTTPFakeService implements HTTPService {
  //Class Responsible For Fetching Data From HTTP Source, or a Mock Source
  Future<HttpResponse> getDataFromAPI() async {
    final data = await MockService.getData("Success");
    return HttpResponse(statusCode: 400, data: data);
  }
}

abstract class HTTPService {
  Future<HttpResponse> getDataFromAPI();
}
