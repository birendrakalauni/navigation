import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';
import 'package:navigation/screens/auth/user_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  final Dio dio = Dio();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginScreen')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          spacing: 30,

          // mainAxisAlignment: .center,
          children: [
            TextFormField(
              controller: userNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            TextFormField(
              controller: passwordTextController,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var username = userNameTextController.text.trim();

                  var password = passwordTextController.text.trim();

                  print('USerNAme is $username and password is $password');
                  var userDetails = UserLogin(
                    username: username,
                    password: password,
                  );
                  await login(userDetails);

                  context.go(Routes.ProductScreen);
                },
                child: Text('Login'),
              ),
            ),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      await userDelete(1);
                    },
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text("Delete user"),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> userDelete(int id) async {
    try {
      isLoading = true;
      setState(() {});
      final response = await dio.delete('https://fakestoreapi.com/users/$id');

      if (response.statusCode == 200) {
        // print("User Deleted Successfully");
        print("${response.data}");
      }
    } catch (e) {
      print('$e');
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> login(UserLogin userDetails) async {
    try {
      isLoading = true;
      setState(() {});

      final response = await dio.post(
        'https://fakestoreapi.com/auth/login',
        data: userDetails.toMap(),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print('Token $data');
        context.pushReplacement(Routes.ProductScreen);
      } else {}
      var data = response.data;
      print('Token $data');
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      print("Status Code: ${e.response?.statusCode}");
      print("Response: ${e.response?.data}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      setState(() {});
    }
  }
}
