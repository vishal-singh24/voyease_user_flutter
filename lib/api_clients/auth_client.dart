import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/api_clients/network_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';

String baseUrl = 'https://voyease-backend-53aafeb3505b.herokuapp.com';
var dioClient = Dio();
Future<UserProfileModel> getProfile(String? authToken) async {
  try {
    var response = await dioClient.get(
      "$baseUrl/api/v1/user/profile",
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );

    if (response.statusCode == 200) {
      UserProfileModel profile =
          UserProfileModel.fromJson(response.data as Map<String, dynamic>);
      log(" doreclone $response");

      return profile;
    }
  } on DioException catch (e) {
    log("status Code ${e.response?.statusCode}");
    log('Error $e');

    DioExceptions dioExceptions =
        DioExceptions.fromDioError(dioError: e, errorFrom: "Show Profile");
    DioExceptions.showErrorMessage(
      message: dioExceptions.errorMessage(),
    );
  }

  return UserProfileModel();
}

Future<void> resendOtp(BuildContext context, String? authToken) async {
    final String url = "$baseUrl/api/v1/user/send-email-otp";
    try {
      var response = await dioClient.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('OTP sent successfully'),
            duration: Duration(seconds: 2),
          ),
        );
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
