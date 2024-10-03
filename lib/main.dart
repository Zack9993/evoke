import 'package:evoke/app_state.dart';
import 'package:evoke/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; // Ensure this import is included
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance
      .initialize(); // Ensure you have the correct initialization for Google Mobile Ads
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Gallery App',
          theme: ThemeData(
            brightness:
                appState.isDarkMode ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(), // Ensure SplashScreen is correctly implemented
        );
      },
    );
  }
}
