import 'package:flutter/material.dart';
// import 'pages/login_page.dart'; // Halaman login
import 'pages/users_page.dart'; // Halaman utama

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Laravel API Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/users', // Route awal aplikasi
      routes: {
        // '/login': (context) => LoginPage(), // Halaman login
        '/users': (context) => UsersPage(), // Halaman utama
      },
    );
  }
}