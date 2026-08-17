import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  final String data;
  const ProfileScreen({super.key, required this.data});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.go(Routes.SettingsScreen);
              },
              child: Text('Setting'),
            ),
          ),
        ],
      ),
    );
  }
}
