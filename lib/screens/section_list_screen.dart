import 'package:flutter/material.dart';
import '../models/constitution_section.dart';
import '../services/content_service.dart';
import 'section_detail_screen.dart';

class SectionListScreen extends StatefulWidget {
  const SectionListScreen({super.key});

  @override
  State<SectionListScreen> createState() => _SectionListScreenState();
}

class _SectionListScreenState extends State<SectionListScreen> {
  List<ConstitutionSection> allSections = [];
  List<ConstitutionSection> filteredSections = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await ContentService.loadSections();
    setState(() {
      allSections = data;
      filteredSections = data;
    });
  }

  void filterSections(String query) {
    final q = query.toLowerCase();
    setState(() {
      filteredSections = allSections.where((s) {
        return s.section.toLowerCase().contains(q) ||
            s.plainLanguage.toLowerCase().contains(q) ||
            s.keywords.any((k) => k.toLowerCase().contains(q));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Your Rights')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search rights or keywords',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: filterSections,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSections.length,
              itemBuilder: (context, index) {
                final section = filteredSections[index];
                return ListTile(
                  title: Text(section.section),
                  subtitle: Text(
                    section.plainLanguage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SectionDetailScreen(section: section),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}