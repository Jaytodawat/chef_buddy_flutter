import 'package:chef_buddy/screens/login_page.dart';
import 'package:chef_buddy/screens/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChefBuddy());
}

class ChefBuddy extends StatelessWidget {
  const ChefBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor:const Color(0xFF111328),
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.white)

      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        // backgroundColor: Color(0xFF111328),
        body: SafeArea(child: SignupPage(),),
        
      ),
    );
  }
}
//Color(0xFF111328)