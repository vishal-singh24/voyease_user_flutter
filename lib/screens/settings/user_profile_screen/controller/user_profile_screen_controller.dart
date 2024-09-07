import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/api_clients/network_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';
import 'package:intl/intl.dart';

class UserProfileScreenController extends GetxController {
  final TextEditingController name = TextEditingController();

  List<UserProfileModel> userprofile = [];
  RxString? selectedValue = "".obs;
  final dateController = TextEditingController().obs;
  bool isEditing = false;
  var dioClient = dio.Dio();
  File? pickedPImageFile;
  var pickedProfilePath;
  var imageUrl = Rxn<String>(); 

  @override
  void onInit() {
    getUserProfile();
    getImage();
    super.onInit();
  }

  Future<void> getImage() async{
   try {
      String? url = await ProfileImageStorage.getImage();
      imageUrl.value = url; // Update the observable
    } catch (e) {
      log('Error fetching image URL: $e');
      imageUrl.value = null; // Set to null in case of error
    }
}


  //-------------------------------Method to pick image from user's gallary------------------------------//
  void pickProfileImage() async {
    final picker = ImagePicker();

    pickedProfilePath = await picker.pickImage(source: ImageSource.gallery);
    pickedPImageFile = File(pickedProfilePath!.path);

    log("image file : $pickedPImageFile");
    log("image path :   $pickedProfilePath");
    update();
    uploadImageProfile();
  }

//---------------------------------Method to upload image---------------------------------------//
  uploadImageProfile() async {
    String? authToken = await TokenStorage.getToken();

    String fileName = pickedPImageFile!.path.split('/').last;
    dio.FormData formData = dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromFile(
        pickedPImageFile!.path,
        filename: fileName,
      ),
    });
    try {
      var response = await dioClient.post(
        "$baseUrl/api/v1/common/upload-image",
        data: formData,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        log(" user image upload response: $response");
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('url')) {
          final String url = response.data['url'] as String;
          try {
            await ProfileImageStorage.saveImage(url);
          } catch (e) {
            log("Error saving profile url to SharedPreferences: $e");
          }
        }
      }
    } catch (e) {
      log("Error in uploading image: $e");
    }
  }

//--------------------------------Method to format date in the form dd-MM-YYYY---------------------//
  String formatDateDDMMYYYY(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String formattedDate = DateFormat(dateformat).format(dateTime);

    return formattedDate;
  }

//--------------------------------Method to enable editing-----------------------------------//
  void toggleEditing() {
    isEditing = !isEditing;
    update();
  }

//----------------------------Method to get user's data from api----------------------------//
  Future<void> getUserProfile() async {
    String? authToken = await TokenStorage.getToken();
    try {
      if (authToken != null) {
        UserProfileModel profile = await getProfile(authToken);
        log("user profil=====================e res ====> $profile");

        userprofile = [profile];
        name.text = profile.name ?? '';

        update();
      } else {
        log("No token found");
      }
    } on dio.DioException catch (e) {
      update();
      log("status Code ${e.response?.statusCode}");
      log('Error $e');

      DioExceptions dioExceptions =
          DioExceptions.fromDioError(dioError: e, errorFrom: "USER PROFILE");
      DioExceptions.showErrorMessage(
        message: dioExceptions.errorMessage(),
      );
    }
  }
}
