import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to [Your App Name]! Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the app.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32), // Adjust the spacing as needed
            Text(
              "Data Security",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We implement industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, or destruction. However, please note that no method of transmission over the internet or method of electronic storage is 100% secure.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32), // Adjust the spacing as needed
            Text(
              "Children's Privacy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have collected information from a child under 13, we will take steps to delete it.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32), // Adjust the spacing as needed
            Text(
              "Changes to This Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We may update this Privacy Policy from time to time. Any changes will be posted on this page, and the Last Update 28-Aug-2024 date will be revised. We encourage you to review this Privacy Policy periodically to stay informed about how we are protecting your information.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
