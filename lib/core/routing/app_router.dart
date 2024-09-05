import 'package:flutter/material.dart';
import 'package:voyease_frontend/screens/auth/enter_otp_screen/view/enter_otp_screen.dart';
import 'package:voyease_frontend/screens/auth/forgot_pswd_screen/view/forgot_pswd_screen.dart';
import 'package:voyease_frontend/screens/auth/landing_screen.dart';
import 'package:voyease_frontend/screens/auth/login_screen/view/login_screen.dart';
import 'package:voyease_frontend/screens/auth/mobile_no_otp_screen/view/mobile_no_otp_screen.dart';
import 'package:voyease_frontend/screens/auth/password_reset_screen/view/password_reset_screen.dart';
import 'package:voyease_frontend/screens/auth/reset_done_screen.dart';
import 'package:voyease_frontend/screens/auth/select_language_screen.dart';
import 'package:voyease_frontend/screens/auth/sign_up_verify_screen/views/sign_up_verify_screen.dart';
import 'package:voyease_frontend/screens/auth/signup_screen/view/signup_screen.dart';
import 'package:voyease_frontend/screens/main_screen/view/main_screen.dart';
import 'package:voyease_frontend/screens/settings/about_us_screen.dart';
import 'package:voyease_frontend/screens/settings/feedback_form_screen.dart';
import 'package:voyease_frontend/screens/settings/previous_bookings_screen.dart';
import 'package:voyease_frontend/screens/settings/raise_issue_screen.dart';
import 'package:voyease_frontend/screens/settings/settings_screen/view/settings_screen.dart';
import 'package:voyease_frontend/screens/settings/user_profile_screen/view/user_profile_screen.dart';
import 'package:voyease_frontend/screens/shop/shop_main_screen.dart';

class AppRoutes {
  static const loginScreen = '/loginSceen';
  static const signUpVerifyScreen = '/signUpVerifySceen';
  static const signUpScreen = '/signUpScreen';
  static const enterOtpScreen = '/enterOtpScreen';
  static const forgotPswdScreen = '/forgotPswdScreen';
  static const landingScreen = 'landingScreen';
  static const passwordResetScreen = '/passwordResetScreen';
  static const resetDoneScreen = '/resetDoneScreen';
  static const selectLanguageScreen = 'selectLanguageScreen';
  static const settingsScreen = '/settingsScreen';
  static const shopMainScreen = '/shopMainScreen';
  static const mainScreen = '/mainScreen';
  static const userProfileScreen = '/userProfileScreen';
  static const previousBookingsScreen = '/previousBookingsScreen';
  static const raiseIssueScreen = '/raiseIssueScreen';
  static const feedbackFormScreen = '/feedbackFromScreen';
  static const aboutUsScreen = '/aboutUsScreen';
  static const enterMobileNoOtpScreen='/enterMobileNoOtpScreen';
  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => const LoginScreen(),
    signUpVerifyScreen: (context) => const SignUpVerifyScreen(),
    signUpScreen: (context) => const SignupScreen(),
    enterOtpScreen: (context) => const EnterOtpScreen(),
    forgotPswdScreen: (context) => const ForgotPswdScreen(),
    landingScreen: (context) => const LandingScreen(),
    passwordResetScreen: (context) => const PasswordResetScreen(),
    resetDoneScreen: (context) => const ResetDoneScreen(),
    selectLanguageScreen: (context) => const SelectLanguageScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    shopMainScreen: (context) => const ShopMainScreen(),
    mainScreen: (context) => const MainScreen(),
    userProfileScreen: (context) => const UserProfileScreen(),
    previousBookingsScreen: (context) => const PreviousBookingsScreen(),
    raiseIssueScreen: (context) => const RaiseIssueScreen(),
    feedbackFormScreen: (context) => const FeedbackFormScreen(),
    aboutUsScreen: (context) => const AboutUsScreen(),
    enterMobileNoOtpScreen:(context)=> const EnterMobileNoOtpScreen(),
  };
  
}
