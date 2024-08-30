import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Us",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to Shopping App, your ultimate destination for a seamless and enjoyable shopping experience. We are passionate about bringing you the latest trends and best deals, all at the touch of a button. Our mission is to revolutionize the way you shop, making it easier, faster, and more fun than ever before",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Who We Are",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "At Shopping App, we are a team of innovators and shopping enthusiasts dedicated to creating a platform that meets all your needs. We understand the value of your time and money, which is why we've curated a wide range of products across various categories, ensuring quality, variety, and affordability.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Our Commitment",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We are committed to providing exceptional service and an enjoyable shopping experience. We believe in transparency, quality, and customer satisfaction. Our team is always working to improve our app, bringing you new features, exclusive deals, and a shopping experience that exceeds your expectations.",
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
