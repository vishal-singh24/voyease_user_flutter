import 'dart:io';

import 'package:dio/dio.dart';
import 'package:voyease_frontend/models/google_login_model.dart';
import 'package:voyease_frontend/models/login_model.dart';
import 'package:voyease_frontend/models/signup_model.dart';
import 'package:voyease_frontend/models/token_response.dart';

class AuthClient {
  final Dio dio;

  AuthClient(this.dio);

  Future<TokenResponse> signup(SignupModel data) async {
    try {
      var res = await dio.post("/auth/signup", data: data.toJson());
      if (res.statusCode == HttpStatus.ok) {
        return TokenResponse.fromJson(res.data);
      } else {
        throw ApiException(res.data);
      }
    } catch (e) {
      throw ApiException("Error calling api");
    }
  }

  Future<TokenResponse> login(LoginModel data) async {
    try {
      var res = await dio.post("/auth/login", data: data.toJson());
      if (res.statusCode == HttpStatus.ok) {
        return TokenResponse.fromJson(res.data);
      } else {
        throw ApiException(res.data);
      }
    } catch (e) {
      throw ApiException("Error calling api");
    }
  }

  Future<TokenResponse> googleSignup(LoginModel data) async {
    try {
      var res = await dio.post("/auth/login", data: data.toJson());
      if (res.statusCode == HttpStatus.ok) {
        return TokenResponse.fromJson(res.data);
      } else {
        throw ApiException(res.data);
      }
    } catch (e) {
      throw ApiException("Error calling api");
    }
  }

  Future<TokenResponse> googleLogin(GoogleLoginModel data) async {
    try {
      var res = await dio.post("/auth/login", data: data.toJson());
      if (res.statusCode == HttpStatus.ok) {
        return TokenResponse.fromJson(res.data);
      } else {
        throw ApiException(res.data);
      }
    } catch (e) {
      throw ApiException("Error calling api");
    }
  }
}

class ApiException implements Exception {
  ApiException(String s);
}
