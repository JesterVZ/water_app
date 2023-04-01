import 'package:dio/dio.dart';
import 'package:water_app/base/enums/methods/methods.dart';
import 'package:water_app/base/http/http_client.dart';
import 'package:water_app/core/error/exceptions.dart';
import 'package:water_app/data/entities/login/login_request.dart';
import 'package:water_app/domain/repositories/local/shared_preferences_repository.dart';

abstract class LoginRemoteDataSource {
  Future<bool> login(LoginRequest request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({this.httpClient, this.repository});
  ApiClient? httpClient;
  SharedPerferencesRepository? repository;
  @override
  Future<bool> login(LoginRequest request) async {
    Response response = await httpClient!.sendRequest(
        request: request, url: '/login.php?auth=1', method: Method.post);
    if (response.statusCode == 200) {
      repository!.setLoginData(request);
      return true;
    } else {
      throw ServerException();
    }
  }
}
