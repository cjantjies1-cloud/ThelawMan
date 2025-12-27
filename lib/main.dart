import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TheLawManApp());
}

class TheLawManApp extends StatelessWidget {
  const TheLawManApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF0B3C5D); // Deep blue

    final colorScheme =
        ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light);

    final textTheme = const TextTheme(
      headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    );

    return MaterialApp(
      title: 'The LawMan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          centerTitle: true,
          elevation: 2,
        ),
        textTheme: textTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
