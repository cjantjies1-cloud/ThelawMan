class ConstitutionSection {
  final String title;
  final String constitutionText;
  final String explanation;
  final String practicalExample;

  ConstitutionSection({
    required this.title,
    required this.constitutionText,
    required this.explanation,
    required this.practicalExample,
  });

  factory ConstitutionSection.fromJson(Map<String, dynamic> json) {
    final sectionNum = json['section']?.toString() ?? '';
    final official = json['official_summary'] ?? '';
    final plain = json['plain_language'] ?? '';
    final common = (json['common_situations'] as List<dynamic>?)?.cast<String>() ?? [];

    return ConstitutionSection(
      title: sectionNum.isNotEmpty ? 'Section $sectionNum' : (json['title'] ?? ''),
      constitutionText: official,
      explanation: plain,
      practicalExample: common.isNotEmpty ? common.first : '',
    );
  }
}

