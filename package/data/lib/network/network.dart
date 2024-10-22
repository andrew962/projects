import 'package:dio/dio.dart';

import 'models/network_response.model.dart';

class Network {
  late String _baseUrl;
  static final Network _singleton = Network._();
  Network._();
  factory Network({required String baseUrl}) {
    _singleton._baseUrl = baseUrl;
    return _singleton;
  }

  final _headers = {'Content-Type': 'application/json; charset=UTF-8'};

  late Dio _dio;

  static Network get instance {
    return Network._singleton;
  }

  Dio _createDio() {
    var options = BaseOptions(baseUrl: _singleton._baseUrl, headers: _headers);
    _dio = Dio(options);
    return _dio;
  }

  Future<NetworkResponse> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response =
        await _createDio().get(path, queryParameters: queryParameters);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse.ok(response.data);
      }
      return NetworkResponse.err(response.statusMessage ?? "Error.");
    } catch (e) {
      return NetworkResponse.err(response.statusMessage ?? "Error.");
    }
  }

  Future<NetworkResponse> post(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response =
        await _createDio().post(path, queryParameters: queryParameters);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse.ok(response.data);
      }
      return NetworkResponse.err(response.statusMessage ?? "Error");
    } catch (e) {
      return NetworkResponse.err(response.statusMessage ?? "Error");
    }
  }

  Future<NetworkResponse> put(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response =
        await _createDio().put(path, queryParameters: queryParameters);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse.ok(response.data);
      }
      return NetworkResponse.err(response.statusMessage ?? "Error");
    } catch (e) {
      return NetworkResponse.err(response.statusMessage ?? "Error");
    }
  }

  Future<NetworkResponse> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response =
        await _createDio().delete(path, queryParameters: queryParameters);
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
