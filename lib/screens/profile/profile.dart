import 'package:first_app/screens/Favorite/favorite_screen.dart';
import 'package:first_app/screens/language/language.dart';
import 'package:first_app/screens/login_user.dart';
import 'package:first_app/screens/notification/notification.dart';
import 'package:first_app/screens/profile/about_us.dart';
import 'package:first_app/screens/profile/edit_profile.dart';
import 'package:first_app/screens/profile/hlep.dart';
import 'package:first_app/screens/profile/privacy_policy.dart';
import 'package:first_app/screens/profile/term_condition.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditProfileScreen()),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TermCondition()),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpScreen()),
            );
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
            _showSignOutDialog();
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
            _showDeleteDialog();
          },
        ),
      ],
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginUser()),
                );
              },
            ),
          ],
        );
      },
    );
  }
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deleted'),
          content: const Text('Are you sure you want to Delted your Account?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginUser()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
