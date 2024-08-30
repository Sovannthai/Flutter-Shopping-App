import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<ContactItem> contacts = [
    ContactItem(
      icon: Icons.message,
      title: "Chat",
      onTap: () {},
    ),
    ContactItem(
      icon: Icons.phone,
      title: "Phone",
      onTap: () {},
    ),
    ContactItem(
      icon: Icons.email,
      title: "sovannthai@gmail.com.kh",
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(contact.icon),
            title: Text(contact.title),
            onTap: contact.onTap,
          );
        },
      ),
    );
  }
}

class ContactItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ContactItem({required this.icon, required this.title, required this.onTap});
}
