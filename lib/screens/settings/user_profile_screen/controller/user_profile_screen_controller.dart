import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
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

  Future<void> getImage() async {
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

//---------------------------------Function to upload image---------------------------------------//
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

  //----------------------------Function to convert date format in the form dd-MM-YYYY(when the argument is string"----------------------------//
String stringformatDateDDMMYYYY(String? dateString) {
  if (dateString == null || dateString.isEmpty || dateString == "Not Given") {
    // Return "Not Given" if the input is null or empty
    return "Not Given";
  }

  try {
    // Parse the string to DateTime (assuming the input is in 'yyyy-MM-dd' or similar format)
    DateTime date = DateTime.parse(dateString);

    // Format the DateTime to 'dd-MM-yyyy'
    return DateFormat('dd-MM-yyyy').format(date);
  } catch (e) {
    // Handle error if parsing fails
    return "Invalid Date";
  }
}
//--------------------------------Function to format date in the form dd-MM-YYYY---------------------//
  String formatDateDDMMYYYY(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String formattedDate = DateFormat(dateformat).format(dateTime);

    return formattedDate;
  }

//---------------------------Function to format date in the form of YYYY-MM-dd-----------------------//


String formatDateYYYYMMDD(String dateString) {
  // Split the string into parts
  List<String> parts = dateString.split('-');
  
  // Ensure that we have exactly three parts
  if (parts.length != 3) {
    throw const FormatException('Invalid date format. Expected DD-MM-YYYY.');
  }

  // Parse the parts into integers
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);

  // Create a DateTime object
  DateTime date = DateTime(year, month, day);

  // Format the DateTime to the desired format
  return DateFormat('yyyy-MM-dd').format(date);
}


//--------------------------------Function to enable editing-----------------------------------//
  void toggleEditing() {
    isEditing = !isEditing;
    update();
  }

//----------------------------Function to get user's data from api----------------------------//
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

  //---------------------------------Function to post data----------------------------------------//
  Future<void> postProfile(BuildContext context) async {
    String? authToken = await TokenStorage.getToken();
    String? profile = await ProfileImageStorage.getImage();
    final String url = "$baseUrl/api/v1/user/profile";
    Map<String, dynamic> userData = {
      "name": name.text,
      "languages":[],
      "gender": selectedValue!.value,
      "profile": profile,
      "dob": formatDateYYYYMMDD(dateController.value.text)
    };
    try {
      String jsonData = jsonEncode(userData);
      var response = await dioClient.put(
        url,
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );
      log("profile: $userData");
      if (response.statusCode == 200) {
        toggleEditing();
        ProfileImageStorage.deleteImage();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Profile updated successfully"),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content: Text("Profile updation failed"),
          backgroundColor: Colors.red,
        ));
      }
    } on DioException catch (e) {
      DioExceptions dioExceptions = DioExceptions.fromDioError(
          dioError: e, errorFrom: "User Post Profile");
      DioExceptions.showErrorMessage(
        message: dioExceptions.errorMessage(),
      );
    }
  }
}
