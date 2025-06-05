import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/services/storage/auth_service.dart';
import 'package:kitaabe/screens/auth/welcome_view.dart';

import '../../main_tab_bar.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  final AuthService _authService = AuthService();
  User? user;

  Future<void> _handleSignOut() async {
    await _authService.signOutWithGoogle();
    setState(() => user = null);
    // Optionally, navigate to the welcome view after logout
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainTabBar(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text(
          'Log Out',
          style: textTheme.titleLarge,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 160,
        ),
        decoration: BoxDecoration(
          color: TColor.primaryLight,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        width: 400,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Do you wanna log out from this account ?',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    color: Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO',
                      style: textTheme.labelMedium,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: _handleSignOut,
                    child: Text(
                      'YES',
                      style: textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
