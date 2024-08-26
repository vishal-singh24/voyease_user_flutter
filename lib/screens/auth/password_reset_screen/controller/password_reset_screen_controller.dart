import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';

class PasswordResetScreenController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  void onClose() {
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  void clear(){
    password.clear();
    confirmPassword.clear();
  }

  Future<void> resetPassword(BuildContext context, String email, String otp,String password) async {
    final String url = "$baseUrl/api/v1/auth/validate-password-reset";
    Map<String, dynamic> authData = {
      'email': email,
      'otp': otp,
      'password': password
    };
    try{
      String jsonData=jsonEncode(authData);
      var response=await dioClient.post(url,data: jsonData);
      if(response.statusCode==200){
        log("Password reset sucessfull");
         Navigator.pushNamed(context, AppRoutes.resetDoneScreen);
         clear();
      }
    } on DioException catch(e){
      log("Error occurred in Password Reset screen: $e");
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
