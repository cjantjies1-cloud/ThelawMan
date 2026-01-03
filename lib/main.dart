import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TheLawManApp());
}

class TheLawManApp extends StatelessWidget {
  const TheLawManApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The LawMan',
      debugShowCheckedModeBanner: false,
      theme: lawManTheme,
      home: const SplashScreen(),
    );
  }
}
