import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = true;
  bool _locationAccess = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SwitchListTile(
            title: Text('Enable Notifications', style: TextStyle(color: Colors.white)),
            value: _notificationsEnabled,
            activeColor: primaryColor,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          Divider(color: Colors.grey[700]),
          SwitchListTile(
            title: Text('Dark Mode', style: TextStyle(color: Colors.white)),
            value: _darkModeEnabled,
            activeColor: primaryColor,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          Divider(color: Colors.grey[700]),
          SwitchListTile(
            title: Text('Location Access', style: TextStyle(color: Colors.white)),
            value: _locationAccess,
            activeColor: primaryColor,
            onChanged: (bool value) {
              setState(() {
                _locationAccess = value;
              });
            },
          ),
          Divider(color: Colors.grey[700]),
          ListTile(
            title: Text('Account Settings', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to account settings
            },
          ),
          ListTile(
            title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to privacy policy
            },
          ),
          ListTile(
            title: Text('Logout', style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
