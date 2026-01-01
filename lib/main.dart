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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0B3C5D),
          secondary: const Color(0xFF3282B8), // Lighter blue
          surface: const Color(0xFFBBE1FA), // Lightest blue
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Off-white
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B3C5D),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B3C5D),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
