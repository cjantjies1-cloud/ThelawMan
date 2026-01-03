import 'package:flutter/material.dart';
import 'section_list_screen.dart';
import 'privacy_policy_screen.dart';
import 'quiz_screen.dart';
import '../widgets/faded_logo_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The LawMan')),
      body: FadedLogoBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Know Your Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Read the Constitution'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SectionListScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Test Your Knowledge'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              child: const Text('Privacy Policy'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PrivacyPolicyScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
