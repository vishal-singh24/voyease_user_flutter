import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';

class MobileNoOtpScreenController extends GetxController {
  TextEditingController otpController = TextEditingController();

  void verify(BuildContext context, String verificationid, String otp) async {
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: verificationid, smsCode: otp);
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        showVerificationSuccessBottomSheet(context);
      });
    } catch (e) {
      log(e.toString());
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
