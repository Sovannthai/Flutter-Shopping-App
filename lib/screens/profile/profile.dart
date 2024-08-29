import 'package:first_app/screens/Favorite/favorite_screen.dart';
import 'package:first_app/screens/language/language.dart';
import 'package:first_app/screens/notification/notification.dart';
import 'package:first_app/screens/promotion/promotion.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _buildHeader(),
          const Divider(),
          _buildMenuSection(),
          const Divider(),
          _buildSettingSection(),
          const Divider(),
          _buildSupportSection(),
          const Divider(),
          _buildSignOutSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('assets/images/thai.jpg'),
        radius: 30,
      ),
      title: Text('Hi, Petter Lay!'),
      subtitle: Text('10 Orders · 0 Wishlist'),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(
            'assets/icons/edit_profile.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Edit Profile'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Edit Profile
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/promotion.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Promotion'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PromotionScreen()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/favorite.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Wishlist'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            'Setting',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/notification.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Notification'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationScreen()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/global.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Language'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LanguageSettingsScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            'Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/about_us.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('About Us'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to About Us
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/privacy.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Privacy Policy'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Privacy Policy
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/term_condition.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Term & Conditional'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Terms & Conditions
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/help.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Help Center'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to Help Center
          },
        ),
      ],
    );
  }

  Widget _buildSignOutSection() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(
            'assets/icons/exit.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Sign out'),
          onTap: () {
            // Sign out logic
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/trash.png',
            width: 25.0,
            height: 25.0,
          ),
          title: const Text('Delete My Account'),
          onTap: () {
            // Delete account logic
          },
        ),
      ],
    );
  }
}
