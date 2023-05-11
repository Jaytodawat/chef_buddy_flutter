import 'package:chef_buddy/utils/controllers/auth_controller.dart';
import 'package:chef_buddy/screens/home_screen.dart';
import 'package:chef_buddy/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (value) =>ModalProgressHUD(
              inAsyncCall: value.showSpinner,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(image: AssetImage('assets/images/login_chef.png'),
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('LogIn',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text('Please sign in to continue',
                          style: kSubTextStyle,
                        ),
                        const SizedBox(height: 20,),

                        ReusableTextField(controller:emailController, labelText: 'Email ID', obsecureText: false, icon: const Icon(Icons.email_outlined),),
                        ReusableTextField(controller:passwordController, labelText: 'Password', obsecureText: true, icon: const Icon(Icons.lock_open_rounded),),

                        const SizedBox(height: 30,),
                        Center(
                          child: RoundedButton(
                              onPressed:(){
                                 authController.login(emailController.text.trim(), passwordController.text.trim());
                              },
                              text: 'LOGIN'),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: null,
                            child: Text('Forget Password?',
                              style: kSubTextStyle.copyWith(color: Colors.grey.shade800),),
                          ),
                        ),
                        const SizedBox(height: 80,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?", style: kSubTextStyle,),
                            TextButton(
                                onPressed: (){
                                  Get.to(()=>SignupPage());
                                },
                                child: Text('Sign up', style: kSubTextStyle.copyWith(color: Colors.blue),))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}

//Color(0xFF0df5e3)