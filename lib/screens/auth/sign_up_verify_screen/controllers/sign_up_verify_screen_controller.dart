import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';
import 'package:voyease_frontend/widgets/buttons/primary_button.dart';

class SignUpVerifyScreenController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  var dioClient = Dio();

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  Future<void> validateOtp(BuildContext context) async {
    String? authToken = await TokenStorage.getToken();

    if (authToken == null || authToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Authorization token is missing'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final String url = "$baseUrl/api/v1/user/validate-email-otp";
    Map<String, dynamic> otpData = {
      "opt": otpController.text,
    };

    if (otpData["opt"] == null || otpData["opt"].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('OTP field cannot be empty'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      String jsonData = jsonEncode(otpData);
      var response = await dioClient.post(
        url,
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json',
          },
        ),
      );
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        log("OTP authentication successful $response");
        await TokenStorage.deleteToken();
        showVerificationSuccessBottomSheet(context);

        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   backgroundColor: Colors.blue,
        //   content: Text('OTP Verification Successfull'),
        //   duration: Duration(seconds: 2),
        // ));
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData['errorMessage'] == "Otp expired") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Text('OTP Expired'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('OTP Verification Failed. Please Enter Correct OTP'),
            duration: Duration(seconds: 2),
          ));
        }
      }
    }
  }

  Future<void> resendOtp(BuildContext context) async {
    final String? authToken = await TokenStorage.getToken();
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

  void showVerificationSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.landingScreen);
                  },
                ),
              ),
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Account Verified Successfully!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    Text(
                      "The account is verified successfully with the registered email id. Please login for the app services.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
