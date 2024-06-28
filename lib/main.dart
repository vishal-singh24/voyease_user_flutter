import 'package:flutter/material.dart';
import 'package:voyease_frontend/app_router.dart';
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
      home: SplashScreen(
        nextScreen: MaterialApp.router(
          routerConfig: getIt<AppRouter>().config(),
        ),
      ),
    );
  }
}
