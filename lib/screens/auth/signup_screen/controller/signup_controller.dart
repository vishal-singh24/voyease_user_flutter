import 'dart:convert';
import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class SignupController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  var dioClient = Dio();

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ["openid", "email", "profile"],
  );
  RxBool isAuthorized = false.obs;
  Rx<GoogleSignInAccount?> currentUser = Rx<GoogleSignInAccount?>(null);
  Rx<Country> selectedCountry = Country(
          phoneCode: "91",
          countryCode: "IN",
          e164Sc: 0,
          geographic: true,
          level: 1,
          name: "India",
          example: "India",
          displayName: "India",
          displayNameNoCountryCode: "IN",
          e164Key: "")
      .obs;

  void initState() {
    super.onInit();

    print("current user ${googleSignIn.currentUser}");
    googleSignIn.currentUser?.authHeaders.then(
      (value) {
        print("value = $value");
      },
    );

    googleSignIn.onCurrentUserChanged
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

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    usernameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    isChecked.value = false;
  }

  void showcountryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      countryListTheme: const CountryListThemeData(bottomSheetHeight: 600),
      onSelect: (Country value) {
        selectedCountry.value = value;
        log("Selected country: ${value.displayName}");
      },
    );
  }

  Future<void> handleSignIn(BuildContext context) async {
    try {
      log("Initiating Google Sign-In");
      var res = await googleSignIn.signIn();
      if (res != null) {
        log("Google Sign-In successful: ${res.displayName}");
        var auth = await res.authentication;
        log("Access token: ${auth.accessToken}");
        log("ID token: ${auth.idToken}");

        // Call the signup method with the context and tokens
        await googleSignup(context, auth.idToken!);
      } else {
        log("Google Sign-In canceled");
      }
    } catch (error, stack) {
      log("Error during Google Sign-In: $error");
      log("Stack trace: $stack");
    }
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
    log("ischecked value: $isChecked");
  }

  String formatPhoneNumber(String phoneNumber, String countryCode) {
    // Remove all non-numeric characters, just in case
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Add the + and country code
    log('Numberwith country code: +$countryCode$phoneNumber');
    return '+$countryCode$phoneNumber';
  }
  

  Future<void> signup(
      BuildContext context, String email, String phoneNo) async {
    final String url = "$baseUrl/api/v1/auth/signup";
    Map<String, dynamic> authData = {
      "email": emailController.text,
      "name": usernameController.text,
      "phone":phoneNo,
      "languages": [0],
      "password": passwordController.text
    };
    try {
      String jsonData = jsonEncode(authData);
      final response = await dioClient.post(url, data: jsonData);
      log("signup response$response");

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('token')) {
          final String token = response.data['token'] as String;

          await TokenStorage.saveToken(token);
          log("Stored token: $token");
          clear();

          Navigator.pushNamed(context, AppRoutes.signUpVerifyScreen,
              arguments: {'email': email, 'phoneNo': phoneNo});
        }
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

  Future<void> googleSignup(BuildContext context, String idToken) async {
    final String url =
        "$baseUrl/api/v1/auth/google-signup"; // Replace with your actual endpoint
    try {
      var res = await googleSignIn.signIn();
      if (res != null) {
        GoogleSignInAuthentication auth = await res.authentication;
        log("Google ID token: ${auth.idToken}");

        Map<String, dynamic> authData = {
          "token": auth.idToken,
          "phone": "9026906590", //passing number just for checking
        };

        String jsonData = jsonEncode(authData);
        final response = await dioClient.post(url, data: jsonData);
        log("Google signup response: $response");

        if (response.statusCode == 200) {
          if (response.data is Map<String, dynamic> &&
              response.data.containsKey('token')) {
            final String token = response.data['token'] as String;

            await TokenStorage.saveToken(token);
            log("Stored token: $token");
            //clear();
            showVerificationSuccessBottomSheet(context);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Creation Failed'),
            ),
          );
        }
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
      log("Google Signup Failed: $e");
    } catch (error, stack) {
      log("Google Sign-In Failed: $error");
      log("Stack Trace: $stack");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Sign-In Failed')),
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
