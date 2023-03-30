import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:water_app/base/enums/methods/methods.dart';
import 'package:water_app/const/app.dart';

class ApiClient {
  final Dio _apiClient = _getDio(baseUrl: '');
  static Dio _getDio({String? baseUrl}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: App.apiRequestTimeout,
      contentType: Headers.jsonContentType,
    ));
  }

  Future<Response> sendRequest(
      {required dynamic request,
      required String url,
      required Method method}) async {
    switch (method) {
      case Method.get:
        return await _apiClient.get("${App.baseUrl}$url");
      case Method.post:
        return await _apiClient.post("${App.baseUrl}$url",
            data: jsonEncode(request));
    }
  }
}
