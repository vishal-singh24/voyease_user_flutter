import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/theme/app_theme.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/firebase_options.dart";
import "package:voyease_frontend/screens/auth/landing_screen.dart";
import "package:voyease_frontend/screens/main_screen/view/main_screen.dart";
import "package:voyease_frontend/screens/splash_screen.dart";
import "package:voyease_frontend/utils/shared_preferences.dart";

void main() async {
  //configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final bool isLoggedIn = await _checkLoginStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> _checkLoginStatus() async {
  String? token = await TokenStorage.getToken();
  return token != null;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      builder: appBuilder,
      routes: AppRoutes.routes,
      home: SplashScreen(
          nextScreen: isLoggedIn ? const MainScreen() : const LandingScreen()),
    );
  }

  Widget appBuilder(context, child) {
    // Retrieve the MediaQueryData from the current context.
    final mediaQueryData = MediaQuery.of(context);

    // Calculate the scaled text factor using the clamp function to ensure it stays within a specified range.
    final scale = mediaQueryData.textScaler.clamp(
      minScaleFactor: 1.0, // Minimum scale factor allowed.
      maxScaleFactor: 1.3, // Maximum scale factor allowed.
    );

    // Create a new MediaQueryData with the updated text scaling factor.
    // This will override the existing text scaling factor in the MediaQuery.
    // This ensures that text within this subtree is scaled according to the calculated scale factor.
    return MediaQuery(
      // Copy the original MediaQueryData and replace the textScaler with the calculated scale.
      data: mediaQueryData.copyWith(
        textScaler: scale,
      ),
      // Pass the original child widget to maintain the widget hierarchy.
      child: child!,
    );
  }
}
