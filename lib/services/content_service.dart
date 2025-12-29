import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/constitution_section.dart';

class ContentService {
  static Future<List<ConstitutionSection>> loadSections() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/constitution_sections.json');

    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData
        .map((item) => ConstitutionSection.fromJson(item))
        .toList();
  }
}