import 'package:evoke/views/ad_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'settings_screen.dart';
import 'notification_screen.dart';
import 'terms_conditions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdManager.loadBannerAd();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text('Home Screen Content'))),
          SizedBox(
            height: 50,
            child: AdWidget(ad: AdManager.bannerAd!),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
            ),
            ListTile(
              title: const Text('Terms and Conditions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsConditionsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
