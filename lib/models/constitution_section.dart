class ConstitutionSection {
  final String section;
  final String officialSummary;
  final String plainLanguage;
  final List<String> commonSituations;
  final List<String> keywords;

  ConstitutionSection({
    required this.section,
    required this.officialSummary,
    required this.plainLanguage,
    required this.commonSituations,
    required this.keywords,
  });

  factory ConstitutionSection.fromJson(Map<String, dynamic> json) {
    return ConstitutionSection(
      section: json['section'],
      officialSummary: json['official_summary'],
      plainLanguage: json['plain_language'],
      commonSituations:
          List<String>.from(json['common_situations'] ?? []),
      keywords: List<String>.from(json['keywords'] ?? []),
    );
  }
}