import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var dioClient = Dio();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

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

        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('token')) {
          final String token = response.data['token'] as String;
          try {
            await TokenStorage.saveToken(token);

            log("Stored token: $token");
            UserProfileModel userProfile = await getProfile(token);

            // if (userProfile.emailVerified == true) {
              //Navigate to the main screen if email is verified
              Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
            // } else {
            //   // Navigate to the signup verify screen if email is not verified
            //   String? authToken = await TokenStorage.getToken();
            //   resendOtp(context, authToken);
            //   Navigator.pushReplacementNamed(
            //       context, AppRoutes.signUpVerifyScreen);
            // }
            clear();
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
        if (errorData is Map<String, dynamic> &&
            errorData['errorMessage'] == "Invalid username or password") {
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
