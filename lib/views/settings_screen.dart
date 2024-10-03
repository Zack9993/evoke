import 'package:evoke/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStatez>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: appState.isDarkMode,
          onChanged: (value) {
            appState.toggleDarkMode();
          },
        ),
      ),
    );
  }
}
