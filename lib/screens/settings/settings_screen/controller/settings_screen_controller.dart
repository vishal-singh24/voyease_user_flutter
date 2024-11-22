import 'dart:developer';

import 'package:get/get.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class SettingsScreenController extends GetxController {
  List<UserProfileModel> userprofile = [];
  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      String? authToken = await TokenStorage.getToken();

      if (authToken != null) {
        UserProfileModel profile = await getProfile(authToken);
        log("profile: $profile");
        userprofile=[profile];
        update();
      } else {
        log("No token found");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
