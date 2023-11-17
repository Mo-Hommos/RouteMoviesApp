import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen.dart';
class SplashScreen extends StatelessWidget{
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
    });
    return Scaffold(
      body: Image.asset(
        'assest/img/splash.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
