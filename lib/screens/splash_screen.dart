import 'package:chef_buddy/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chef_buddy/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInPage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF111328),
          child: const Center(child: Image(image: AssetImage('assets/images/splash_chef.png'),),)
        ),
    );
  }
}
