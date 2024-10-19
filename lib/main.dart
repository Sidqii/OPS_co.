import 'package:flutter/material.dart';
import 'package:pusdatin_apk/layout/inventory/inventory_page.dart';
import 'package:pusdatin_apk/layout/auth/login_page.dart';
import 'package:pusdatin_apk/layout/home/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pusdatin App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white, // Mengubah warna kursor menjadi putih
        ),
      ),
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigasi splash_screen
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
