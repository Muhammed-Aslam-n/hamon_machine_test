import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

/// A simple screen displaying the privacy policy of the application.

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                'Privacy Policy',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              const Text(
                "Privacy Policy for Academy\n\n"
                    "Effective Date: 24/05/024\n\n"
                    "1. Introduction\n\n"
                    "Welcome to Academy. We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and share your information when you use our app.\n\n"
                    "2. Information We Collect\n\n"
                    "Personal Information: We may collect personal information such as your name, email address, and age when you register for an account.\n"
                    "Usage Data: We collect information about your interactions with the app, such as the features you use and the time spent on the app.\n"
                    "Device Information: We collect information about the device you use to access our app, including the device model, operating system, and IP address.\n\n"
                    "3. How We Use Your Information\n\n"
                    "To Provide and Maintain Our Service: We use your information to deliver the app’s features and improve its functionality.\n"
                    "To Communicate with You: We may use your contact information to send updates, notifications, and promotional messages.\n"
                    "To Improve Our App: We analyze usage data to understand how our app is used and to make improvements.\n\n"
                    "4. Sharing Your Information\n\n"
                    "We do not sell your personal information. We may share your information with third parties only in the following circumstances:\n"
                    "With Your Consent: We will share your information when you provide explicit consent.\n"
                    "Service Providers: We may share information with third-party service providers who perform services on our behalf.\n"
                    "Legal Requirements: We may disclose your information if required by law or to protect our rights and property.\n\n"
                    "5. Security\n\n"
                    "We implement reasonable security measures to protect your personal information. However, no method of transmission over the internet or electronic storage is completely secure.\n\n"
                    "6. Your Choices\n\n"
                    "Access and Update: You can access and update your personal information through your account settings.\n"
                    "Opt-Out: You can opt-out of receiving promotional communications from us by following the unsubscribe instructions in those communications.\n\n"
                    "7. Changes to This Privacy Policy\n\n"
                    "We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page.\n\n"
                    "8. Contact Us\n\n"
                    "If you have any questions about this Privacy Policy, please contact us at [your contact email].",
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
