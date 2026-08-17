import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings Screen")),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.go(Routes.MoreScreen);
              },
              child: Text('More'),
            ),
          ),
        ],
      ),
    );
  }
}
