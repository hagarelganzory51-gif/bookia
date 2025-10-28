import 'dart:developer';

import 'package:bookia/core/services/dio/api_endpoint.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/model/auth_params.dart';
import 'package:bookia/feature/auth/data/model/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        //parse json to object
        var body = res.data;
        // store token or user data in shared pref
        var useobj = AuthResponse.fromJson(body);
        SharedPref.saveUserData(useobj.data!);
        return useobj;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var body = res.data;
        // store token or user data in shared pref
        var useobj = AuthResponse.fromJson(body);
        SharedPref.saveUserData(useobj.data!);
        return useobj;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.forgetPassword,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var body = res.data;
        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
