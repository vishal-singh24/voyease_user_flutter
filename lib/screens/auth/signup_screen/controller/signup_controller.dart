import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';

class SignupController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  var dioClient = Dio();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ["openid", "email", "profile"],
  );
  RxBool isAuthorized = false.obs;
  Rx<GoogleSignInAccount?> currentUser = Rx<GoogleSignInAccount?>(null);

  @override
  void initState() {
    super.onInit();

    print("current user ${_googleSignIn.currentUser}");
    _googleSignIn.currentUser?.authHeaders.then(
      (value) {
        print("value = $value");
      },
    );

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorizedValue = account != null;
      print("is Authorized = $isAuthorized");

      currentUser.value = account;
      isAuthorized.value = isAuthorizedValue;

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      // if (isAuthorized) {
      //   unawaited(_handleGetContact(account!));
      // }
    });
  }

  Future<void> _handleSignIn() async {
    try {
      // await _googleSignIn.disconnect();
      var res = await _googleSignIn.signIn();
      res?.authentication.then(
        (value) {
          log("access token: ${value.accessToken}\n");
          log("id token: ${value.idToken}\n\n");
        },
      );
    } catch (error, stack) {
      print(error);
      print(stack);
    }
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
    log("ischecked value: $isChecked");
  }

  Future<void> signup(BuildContext context) async {
    final String url = "$baseUrl/api/v1/auth/signup";
    Map<String, dynamic> authData = {
      "email": emailController.text,
      "name": usernameController.text,
      "phone": phoneController.text,
      "languages": [0],
      "password": passwordController.text
    };
    try {
      String jsonData = jsonEncode(authData);
      final response = await dioClient.post(url, data: jsonData);
      log("signup response$response");

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account Creation successful'),
          ),
        );
        context.navigateNamedTo(SignUpVerifyRoute.name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account Creation Failed'),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData['errorMessage'] == "Record already exists") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Text('Your account already exists. Please log in.'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Creation Failed'),
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
      update();
      log("Signup Failed: $e");
    }
  }
}
