import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

/// A simple screen displaying the terms and conditions of the application.

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: width * 0.1,
              ),
              Text(
                'Terms and Conditions',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              const Text(
                "Terms and Conditions for Academy\n\n"
                "Effective Date: 24/05/2024\n\n"
                "1. Introduction\n\n"
                "Welcome to Academy. By using our app, you agree to these Terms and Conditions. Please read them carefully.\n\n"
                "2. Use of the App\n\n"
                "Eligibility: You must be at least [minimum age] years old to use this app.\n"
                "Account Registration: You must provide accurate information when creating an account and keep your account information up-to-date.\n"
                "Prohibited Activities: You agree not to engage in any activity that could harm our app or its users, including but not limited to hacking, spamming, or uploading malicious content.\n\n"
                "3. Intellectual Property\n\n"
                "All content and features available on the app are the property of Academy or its licensors. You may not use, reproduce, or distribute any content from the app without our prior written permission.\n\n"
                "4. User Content\n\n"
                "You are responsible for any content you post on the app. By posting content, you grant Academy a non-exclusive, royalty-free license to use, reproduce, and distribute your content.\n\n"
                "5. Termination\n\n"
                "We reserve the right to terminate or suspend your account at any time, without notice, if you violate these Terms and Conditions.\n\n"
                "6. Disclaimer of Warranties\n\n"
                "The app is provided \"as is\" without warranties of any kind. We do not guarantee that the app will be available at all times or free from errors.\n\n"
                "7. Limitation of Liability\n\n"
                "Academy will not be liable for any damages arising from your use of the app, including but not limited to indirect, incidental, or consequential damages.\n\n"
                "8. Changes to These Terms\n\n"
                "We may update these Terms and Conditions from time to time. We will notify you of any changes by posting the new terms on this page.\n\n"
                "9. Governing Law\n\n"
                "These Terms and Conditions are governed by the laws of [Your Country/State]. Any disputes arising from these terms will be resolved in the courts of [Your Country/State].\n\n"
                "10. Contact Us\n\n"
                "If you have any questions about these Terms and Conditions, please contact us at [your contact email].",
              ),
              SizedBox(
                height: width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
