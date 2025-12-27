import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xFF0B3C5D), // Deep blue
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B3C5D),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

