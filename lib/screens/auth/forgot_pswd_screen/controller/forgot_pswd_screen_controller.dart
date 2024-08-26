import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';

class ForgotPswdScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  var dioClient = Dio();
  Future<void> emailToSendOTP(BuildContext context) async {
    final String url = "$baseUrl/api/v1/auth/password-reset";
    Map<String, dynamic> authData = {
      "email": emailController.text,
    };
    try {
      String jsonData = jsonEncode(authData);
      var response = await dioClient.post(url, data: jsonData);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('OTP sent successfully'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pushNamed(context, AppRoutes.enterOtpScreen,arguments: emailController.text);
        emailController.clear();
      }
    } on DioException catch (e) {
      log("Error occured while sending OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('An Error Occured!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
