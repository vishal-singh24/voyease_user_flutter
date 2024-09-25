import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:voyease_frontend/api_clients/auth_client.dart';
import 'package:voyease_frontend/api_clients/network_client.dart';
import 'package:voyease_frontend/utils/shared_preferences.dart';

class TourGuideSelectionController extends GetxController {
  var selectedOption = ''.obs;
  var languages = <String>[].obs;
  var selectedLanguages = <String>[].obs;
  var selectedGroupSize = ''.obs;
  var selectedTimeSlot = ''.obs;
  var showAdditionalButtons = false.obs;
  var tourGuideSelection = ''.obs;
  var tourTypeSelection = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLanguages();
  }

//------------------------Function to check whether "Book now and Tour type" should work or not----------------------//
  bool isInRange(DateTime now, int startHour, int endHour) {
    return now.hour >= startHour && now.hour < endHour;
  }

//----------------------condition to show Time slot and (Back and Book Trip) Button after selecting Book for tomorrow--------------------//
  void toggleAdditionalButtons(bool value) {
    showAdditionalButtons.value = value;
    update();
  }

//-------------------Function for selection of guide type after selecting Tour guide-------------//
  void selectTourGuide(String guideType) {
    tourGuideSelection.value = guideType;
    update();
  }

//---------------------Function for the selection of the type(select your type)------------------//
  void selectTourType(String tourType) {
    tourTypeSelection.value = tourType;
    update();
  }

//-------------------------Function for selection of time slot---------------------------------//
  void timeSlotSelection(String timeslot) {
    selectedTimeSlot.value = selectedTimeSlot.value != timeslot ? timeslot : '';
    update();
  }

  //---------------------------------Function for selection between Tour Guide and Tour buddy--------------------//
  void selectOption(String option) {
    selectedOption.value = selectedOption.value != option ? option : '';
    update();
  }

//--------------------------Function for selection of languages----------------------------//
  void languageSelection(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
    update();
  }

//--------------------------Function for the selection of group size-----------------------------//
  void selectGroupSize(String groupSize) {
    selectedGroupSize.value =
        selectedGroupSize.value != groupSize ? groupSize : '';
    update();
  }

//-----------------------Function to call if the booking is for tomorrow---------------------//

  String? getTomorrowDateTime(String selectedTimeSlot) {
    DateTime now = DateTime.now();

    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    if (selectedTimeSlot.startsWith('5')) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss")
          .format(DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0));
    } else if (selectedTimeSlot.startsWith('7')) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss")
          .format(DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 7, 0));
    }
    else if (selectedTimeSlot.startsWith('9')) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss")
          .format(DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0));
    } else if (selectedTimeSlot.startsWith('11')) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss")
          .format(DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 11, 0));
    } else {
      return null;
    }
  }

//----------------------------Function to post booking data--------------------------------//
  Future<void> postBooking(double latitude, double longitude,
      bool isBookingForToday, BuildContext context) async {
    String? authToken = await TokenStorage.getToken();
    List<Map<String, dynamic>> data = await fetchLanguageData(authToken);
    List<int> selectedLanguageIds =
        getSelectedLanguageIds(selectedLanguages, data);

    final String url = "$baseUrl/api/v1/bookings";
    Map<String, dynamic> bookingData = {
      "bookingTime": DateTime.now().toIso8601String(),
      "arrivalTime": isBookingForToday
          ? DateTime.now().toIso8601String()
          : getTomorrowDateTime(selectedTimeSlot.value),
      "groupSize": getSelectedGroupSize(selectedGroupSize.value),
      "languages": selectedLanguageIds,
      "guideType": selectedOption.value == "Tour Guide"
          ? tourGuideSelection.value
          : selectedOption.value == "Tour Buddy"
              ? "BUDDY"
              : null,
      "location": {"latitude": latitude, "longitude": longitude}
    };
    try {
      String jsonData = jsonEncode(bookingData);
      log("booking json: $jsonData");
      final response = await dioClient.post(url,
          data: jsonData,
          options: Options(headers: {'Authorization': 'Bearer $authToken'}));

      log("Response from post booking $response");
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Booking Posted Successfully"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Booking Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on DioException catch (e) {
      log("Status code ${e.response?.statusCode}");
      log("Error $e");
      DioExceptions dioExceptions =
          DioExceptions.fromDioError(dioError: e, errorFrom: "Post Booking");
      DioExceptions.showErrorMessage(
        message: dioExceptions.errorMessage(),
      );
    } catch (e) {
      log("Error $e");
    }
  }

  //----------------------------------Function to convert Selected group size(String) to int-------------------------------//
  int getSelectedGroupSize(String groupSize) {
    if (groupSize.contains('-')) {
      return int.parse(groupSize.split('-').last);
    } else {
      throw const FormatException("Invalid Group Size");
    }
  }

  //--------------------Function to get the list of languages from API------------------------//
  Future<void> fetchLanguages() async {
    try {
      String? authToken = await TokenStorage.getToken();
      List<Map<String, dynamic>> data = await fetchLanguageData(authToken);
      languages.value = getLanguages(data);
      update();
    } catch (e) {
      Get.snackbar("Error", "Failed to load languages");
    }
  }
}
