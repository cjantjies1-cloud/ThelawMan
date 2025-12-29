import 'package:flutter/material.dart';
import '../models/constitution_section.dart';

class SectionDetailScreen extends StatelessWidget {
  final ConstitutionSection section;

  const SectionDetailScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(section.section)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.section,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            _ExpandableCard(
              title: 'What the Constitution says',
              content: section.officialSummary,
            ),

            _ExpandableCard(
              title: 'In simple terms',
              content: section.plainLanguage,
            ),

            if (section.commonSituations.isNotEmpty)
              _ExpandableListCard(
                title: 'Common situations',
                items: section.commonSituations,
              ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: section.keywords
                  .map((k) => Chip(label: Text(k)))
                  .toList(),
            ),

            const SizedBox(height: 24),
            const Text(
              'This information is for education only and is not legal advice.',
              style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandableCard extends StatelessWidget {
  final String title;
  final String content;

  const _ExpandableCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF0B3C5D),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(content, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class _ExpandableListCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const _ExpandableListCard({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF0B3C5D),
          ),
        ),
        children: items
            .map(
              (item) => ListTile(
                leading: const Icon(Icons.circle, size: 8),
                title: Text(item),
              ),
            )
            .toList(),
      ),
    );
  }
}