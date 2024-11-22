import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/api_clients/network_client.dart';
import 'package:voyease_frontend/models/user_profile_model.dart';

String baseUrl ="http://ec2-13-127-182-19.ap-south-1.compute.amazonaws.com:8080";
const String dateformat = 'dd-MM-yyyy';
var dioClient = Dio();

//---------------------------Function to get User Profile-----------------------//
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

//--------------------------Function to resend OTP-------------------------------//
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

//-----------------Function to fetch language from api--------------------------//
Future<List<Map<String, dynamic>>> fetchLanguageData( String? authToken) async {
  final String url = "$baseUrl/api/v1/languages";
  try {
    final response = await dioClient.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      throw Exception('Failed to load languages');
    }
  } catch (e) {
    throw Exception('Error fetching language data: $e');
  }
}

//------- Function to map the language data and return a list of languages----------------//
List<String> getLanguages(List<Map<String, dynamic>> data) {
  return data.map((item) => item['value'].toString()).toList();
}

//----------Function to return list of IDs based on selected languages--------------------//
List<int> getSelectedLanguageIds(
    List<String> selectedLanguages, List<Map<String, dynamic>> data) {
  return data
      .where((item) => selectedLanguages.contains(item['value'].toString()))
      .map((item) => item['id'] as int)
      .toList();
}
