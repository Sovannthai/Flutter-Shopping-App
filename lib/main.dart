import 'package:device_preview/device_preview.dart';
import 'package:first_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to our Shop!',
      home: OnboardingScreen(),
      builder: DevicePreview.appBuilder,
    );
  }
}
