import 'package:flutter/material.dart';
import 'package:chef_buddy/screens/home_screen.dart';
import 'package:chef_buddy/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
    // static AuthController instance = Get.find();
    late Rx<User?> _user;
    bool showSpinner = false;
    FirebaseAuth auth = FirebaseAuth.instance;
    @override
    void onReady() {
      super.onReady();
      _user = Rx<User?>(auth.currentUser);
      _user.bindStream(auth.userChanges());
      ever(_user, _initialScreen);
    }

    _initialScreen(User? user){
      if(user == null){
        Get.offAll(()=> LogInPage());
      } else {
        Get.offAll(()=> HomeScreen());
      }

    }
    void register(String email, String password) async {
      showSpinner = true;
      update();
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.offAll(()=> HomeScreen());
      } catch (e) {
        Get.snackbar("About User", "User Message",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            titleText: const Text(
              "Account Creation Failed",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            messageText: Text(e.toString(), style: const TextStyle(
              color: Colors.white,
            ),)
        );
      }
      showSpinner = false;
      update();
    }
    void login(String email, String password) async {
      showSpinner = true;
      update();
      try {
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.offAll(()=> HomeScreen());
      } catch (e) {
        Get.snackbar("About Login", "Login Message",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            titleText: const Text(
              "Login Failed",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            messageText: Text(e.toString(), style: const TextStyle(
              color: Colors.white,
            ),)
        );
      }
      showSpinner = false;
      update();
    }

    void logout()async{
      await auth.signOut();
    }

}