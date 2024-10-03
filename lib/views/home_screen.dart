import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'notification_screen.dart';
import 'terms_conditions_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdManager.loadBannerAd();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(child: Center(child: Text('Home Screen Content'))),
          Container(
            height: 50,
            child: AdWidget(ad: AdManager.bannerAd!),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen()));
              },
            ),
            ListTile(
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsConditionsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
