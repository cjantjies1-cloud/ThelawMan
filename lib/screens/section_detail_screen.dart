import 'package:flutter/material.dart';
import '../models/constitution_section.dart';
import '../widgets/faded_logo_background.dart';

class SectionDetailScreen extends StatelessWidget {
  final ConstitutionSection section;

  const SectionDetailScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(section.title)),
      body: FadedLogoBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(section.constitutionText,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text('Explanation:\n${section.explanation}'),
              const SizedBox(height: 12),
              Text('Practical Example:\n${section.practicalExample}'),
            ],
          ),
        ),
      ),
    );
  }
}