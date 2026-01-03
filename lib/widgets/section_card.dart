import 'package:flutter/material.dart';
import '../models/constitution_section.dart';
import '../screens/section_detail_screen.dart';

class SectionCard extends StatelessWidget {
  final ConstitutionSection item;
  const SectionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.explanation, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SectionDetailScreen(section: item)),
        ),
      ),
    );
  }
}
