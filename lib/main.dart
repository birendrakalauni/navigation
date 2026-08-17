import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      routerConfig: AppRouter.router,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: LoginScreen(),
      // routes: {
      //   Routes.LoginScreen: (context) => LoginScreen(),
      //   Routes.HomeScreen: (context) => HomeScreen(),
      //   Routes.ProfileScreen: (context) => ProfileScreen(),
      // },
    );
  }
}
