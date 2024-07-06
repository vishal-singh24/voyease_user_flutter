import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/theme/app_theme.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/core/di/di.dart';
import 'package:voyease_frontend/screens/splash_screen.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      builder: appBuilder,
      home: SplashScreen(
        nextScreen: MaterialApp.router(
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().config(),
          builder: appBuilder,
        ),
      ),
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
