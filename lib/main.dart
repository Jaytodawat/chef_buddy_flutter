import 'package:chef_buddy/auth_controller.dart';
import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/screens/home_screen.dart';
import 'package:chef_buddy/screens/login_page.dart';
import 'package:chef_buddy/screens/signup_page.dart';
import 'package:chef_buddy/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const ChefBuddy());
}

class ChefBuddy extends StatelessWidget {
  const ChefBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor:kWhite,
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black)

      ),
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    );
  }
}
//Color(0xFF111328)