import 'package:flutter/material.dart';
import '../widgets/faded_logo_background.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const FadedLogoBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'The LawMan – Privacy Policy',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              Text(
                'Effective Date: 2 January 2026',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),

              SizedBox(height: 16),

              Text(
                '1. Introduction\n'
                'The LawMan is an educational application designed to help users '
                'understand the South African Constitution. We respect your privacy '
                'and are committed to protecting it.\n',
              ),

              Text(
                '2. Information We Collect\n'
                'The LawMan does not require user registration and does not collect '
                'personal information such as names, email addresses, or phone numbers.\n',
              ),

              Text(
                '3. Usage Information\n'
                'The app may collect limited anonymous usage data, such as app interactions '
                'and crash reports, to improve performance and reliability.\n',
              ),

              Text(
                '4. Third-Party Services\n'
                'The LawMan may use services such as Google Firebase for analytics '
                'and crash reporting. These services collect anonymized data '
                'in accordance with their own privacy policies.\n',
              ),

              Text(
                '5. Children’s Privacy\n'
                'The LawMan is suitable for general audiences, including learners. '
                'We do not knowingly collect personal information from children under 13.\n',
              ),

              Text(
                '6. Data Security\n'
                'Reasonable measures are taken to protect information from unauthorized access. '
                'However, no digital system can be completely secure.\n',
              ),

              Text(
                '7. Legal Disclaimer\n'
                'The LawMan is an educational tool and does not provide legal advice. '
                'Users should seek professional legal assistance where required.\n',
              ),

              Text(
                '8. Policy Updates\n'
                'This Privacy Policy may be updated from time to time. Continued use of the app '
                'indicates acceptance of any changes.\n',
              ),

              Text(
                '9. Contact Information\n'
                'For privacy-related questions, please contact the app developer via the '
                'contact details provided in the app store listing.\n',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
