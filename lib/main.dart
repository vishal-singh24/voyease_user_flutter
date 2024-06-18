import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/theme/app_theme.dart';
import 'package:voyease_frontend/core/di/di.dart';
import 'package:voyease_frontend/screens/main.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const Main(),
      // home: const SplashScreen(
      //   nextScreen: SelectLanguage(),
      // ),
      // home: const SelectLanguage(),
    );
  }
}
