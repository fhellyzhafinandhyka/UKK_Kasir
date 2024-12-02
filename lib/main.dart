import 'package:flutter/material.dart';
import 'package:ukkcafe/pages/login_page.dart';
import 'package:ukkcafe/pages/splash_screen.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/loginpage': (context) => LoginPage(),
    },
  ));
}
