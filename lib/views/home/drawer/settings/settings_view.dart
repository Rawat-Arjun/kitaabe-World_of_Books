import 'package:flutter/material.dart';
import 'package:kitaabe/main.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value: themeModeNotifier.value == ThemeMode.dark,
          onChanged: (value) {
            toggleTheme(value);
          },
        ),
      ),
    );
  }
}
