import 'package:flutter/material.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/icons/cambodia.png',
              width: 25.0,
              height: 25.0,
            ),
            title: const Text("Cambodia"),
            onTap: () {
              setState(() {
                selectedLanguage = "Cambodia";
              });
            },
            trailing: Radio<String>(
              value: "Cambodia",
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/english.png',
              width: 25.0,
              height: 25.0,
            ),
            title: const Text("English"),
            onTap: () {
              setState(() {
                selectedLanguage = "English";
              });
            },
            trailing: Radio<String>(
              value: "English",
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 520, 10, 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 7.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF683212),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
