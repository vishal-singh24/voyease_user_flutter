import 'dart:developer';

import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class SettingsScreenController extends GetxController {
  RxString userName = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      String? authToken = await TokenStorage.getToken(); 

      if (authToken != null) {
        UserProfileModel profile =
            await getProfile(authToken); 
            log("profile: $profile");

        userName.value = profile.name!;
        log("userNmae: ${userName.value}");
      } else {
        log("No token found");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
