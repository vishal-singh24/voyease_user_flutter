import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/api_clients/network_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class UserProfileScreenController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
 List<UserProfileModel> userprofile=[];
  bool isEditing = false;
  var dioClient = Dio();
  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  void toggleEditing() {
    isEditing = !isEditing;
    update();
  }

  Future<void> getUserProfile() async {
    String? authToken = await TokenStorage.getToken();
    try {
      if (authToken != null) {
        UserProfileModel profile = await getProfile(authToken);
        log("user profil=====================e res ====> $profile");

       userprofile=[profile];
        name.text = profile.name ?? '';
        email.text = profile.email ?? '';
        phone.text = profile.phone ?? '';
        update();
      }
      else{
        log("No token found");
      }
    } on DioException catch (e) {
      update();
      print("status Code ${e.response?.statusCode}");
      print('Error $e');

      DioExceptions dioExceptions =
          DioExceptions.fromDioError(dioError: e, errorFrom: "USER PROFILE");
      DioExceptions.showErrorMessage(
        message: dioExceptions.errorMessage(),
      );
    }
  }
}
