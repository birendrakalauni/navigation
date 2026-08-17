// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation/routes/app_routes.dart';
// import 'package:navigation/screens/profile_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, this.isLogin});

//   final String? isLogin;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // final data = ModalRoute.of(context)!.settings.arguments;

//     return Scaffold(
//       appBar: AppBar(title: Text("HomeScreen")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 context.go(Routes.ProfileScreen);
//               },
//               child: Text("Profile Screen"),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               context.go(Routes.ProfileScreen, extra: "Hello");
//               // context.pop();
//             },
//             child: Text("Go to Profile"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  final String isLogin;

  const HomeScreen({super.key, required this.isLogin});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go(Routes.ProfileScreen, extra: "Hello");
          },
          child: Text("Go to Profile"),
        ),
      ),
    );
  }
}
