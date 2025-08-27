import 'package:flutter/material.dart';
import 'package:seed/screens/splash_screen.dart';
import 'package:seed/theme/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go2Fast',
      theme: buildAppTheme(),
      home: const SplashScreen(),
    );
  }
}
