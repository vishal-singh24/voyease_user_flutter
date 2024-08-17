import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/models/token_response.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var dioClient = Dio();

  
  Future<void> login(BuildContext context) async {
  final String url = "$baseUrl/api/v1/auth/login";
  Map<String, dynamic> authData = {
    "email": emailController.text,
    "password": passwordController.text
  };

  try {
    String jsonData = jsonEncode(authData);
    final response = await dioClient.post(url, data: jsonData);

    if (response.statusCode == 200) {
      log("Response status code: ${response.statusCode}");
      log("Response data: ${response.data}");

      
      if (response.data is Map<String, dynamic> && response.data.containsKey('token')) {
        final String token = response.data['token'] as String;
        try {
          await TokenStorage.saveToken(token);
          log("Stored token: $token");

          // Replace the route after successful token storage
          context.router.replaceAll([const MainRoute()]);
        } catch (e) {
          log("Error saving token to SharedPreferences: $e");
        }
      } else {
        log("Invalid response format or missing token");
      }
    } else {
      log("Unexpected response status code: ${response.statusCode}");
    }
  } on DioException catch (e) {
    update();
    if (e.response != null && e.response?.statusCode == 400) {
      final errorData = e.response?.data;
      if (errorData is Map<String, dynamic> && errorData['errorMessage'] == "Invalid username or password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('You have entered Wrong Email or Password.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
        ),
      );
    }
    log("Login Failed: $e");
  }
}

}
