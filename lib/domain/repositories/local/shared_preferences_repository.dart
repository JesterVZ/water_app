import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_app/data/entities/login/login_request.dart';

abstract class SharedPerferencesRepository {
  Future<LoginRequest> getLoginData();
  void setLoginData(LoginRequest data);
}

class SharedPerferencesRepositoryImpl implements SharedPerferencesRepository {
  @override
  Future<LoginRequest> getLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString('login-data') ?? "");
  }

  @override
  void setLoginData(LoginRequest data) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('login-data', jsonEncode(data));
  }
}
