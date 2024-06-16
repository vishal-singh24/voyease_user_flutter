import 'package:flutter/material.dart';
import 'package:voyease_frontend/core/di/di.dart';
import 'package:voyease_frontend/screens/select_language.dart';

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
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Poppins"),
      // home: const Landing(),
      // home: const SplashScreen(),
      home: const SelectLanguage(),
    );
  }
}
