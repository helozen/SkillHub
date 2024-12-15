import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      final user = await authService.login(email, password);
      if (user != null) {
        Fluttertoast.showToast(msg: "Welcome, ${user.name}!");
        // Navigate to HomeScreen
      } else {
        Fluttertoast.showToast(msg: "Invalid email or password.");
      }
    } else {
      Fluttertoast.showToast(msg: "All fields are required.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
