import 'package:chef_buddy/utils/controllers/auth_controller.dart';
import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/utils/controllers/home_controller.dart';
import 'package:chef_buddy/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(ChefBuddy());
}

class ChefBuddy extends StatelessWidget {
  ChefBuddy({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(homeController.recipes.length);
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor:kWhite,
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black)

      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
//Color(0xFF111328)