import 'package:flutter/material.dart';
import '../widgets/faded_logo_background.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Constitution Quiz')),
      body: const FadedLogoBackground(
        child: Center(
          child: Text(
            'Quiz engine ready.\n(Add multiple-choice questions per section)',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
