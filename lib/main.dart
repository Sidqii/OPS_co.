import 'package:flutter/material.dart';
import 'package:pusdatin_apk/layout/login_page.dart';
import 'package:pusdatin_apk/widgets/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pusdatin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70)
          ) 
        )
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

  //navigasi splash_screen
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