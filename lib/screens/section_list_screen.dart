import 'package:flutter/material.dart';
import '../data/constitution_sections.dart';
import 'section_detail_screen.dart';
import '../widgets/faded_logo_background.dart';
import '../models/constitution_section.dart';

class SectionListScreen extends StatefulWidget {
  const SectionListScreen({super.key});

  @override
  State<SectionListScreen> createState() => _SectionListScreenState();
}

class _SectionListScreenState extends State<SectionListScreen> {
  String query = '';

  List<ConstitutionSection> _toModelList() {
    return constitutionSections.map((m) {
      return ConstitutionSection(
        title: m['title']?.toString() ?? '',
        constitutionText: m['content']?.toString() ?? '',
        explanation: m['content']?.toString() ?? '',
        practicalExample: '',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final all = _toModelList();
    final filtered = all
        .where((s) => s.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Constitution Sections')),
      body: FadedLogoBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search sections',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() => query = value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final section = filtered[index];
                  return ListTile(
                    title: Text(section.title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SectionDetailScreen(section: section),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}