import 'package:dio/dio.dart';

import 'network_response.model.dart';

class Network {
  String baseUrl = '';
  static final Network _singleton = Network._();
  Network._();
  factory Network({required String baseUrl}) {
    _singleton.baseUrl = baseUrl;
    return _singleton;
  }

  final headers = {'Content-Type': 'application/json; charset=UTF-8'};

  late Dio dio;
  Dio _createDio() {
    var options = BaseOptions(baseUrl: _singleton.baseUrl, headers: headers);
    dio = Dio(options);
    return dio;
  }

  Future<NetworkResponse> get({required String path}) async {
    var response = await _createDio().get(path);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse.ok(response.data);
      }
      return NetworkResponse.err(response.statusMessage ?? "Error");
    } catch (e) {
      return NetworkResponse.err(response.statusMessage ?? "Error");
    }
  }
}
