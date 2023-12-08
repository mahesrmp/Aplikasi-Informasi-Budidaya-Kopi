import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'success_login_page.dart';
import 'auth_manager_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int userId = 1;
  String username = "";

  Future<void> _login() async {
    final String apiUrl = "http://127.0.0.1:8000/api/login";

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // Berhasil login, simpan ID yang login
      // final Map<String, dynamic> data = jsonDecode(response.body);
      // int userId = data['id'];

      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['data']['id'];
        username = data['data']['username'];
      });

      AuthManager.login(userId, username);
      print("Login berhasil. User ID: $userId");
      Navigator.pushReplacementNamed(context, '/after_login');
    } else {
      // Gagal login, Anda dapat menanggapi hasilnya di sini.
      print("Login gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
