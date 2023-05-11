import 'package:chef_buddy/utils/controllers/auth_controller.dart';
import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/drop_down.dart';
import 'package:chef_buddy/custom_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

import '../constants.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  List<String> lst = [
    "Andhra Pradesh",
    "Arunachal Pradesh ",
    "Assam","Bihar",
    "Chhattisgarh",
    "Goa","Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand","Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find();

  bool showSpinner = false;

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (value) =>ModalProgressHUD(
              inAsyncCall: value.showSpinner,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white60, size: 30,),
                          padding: const EdgeInsets.all(0),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Create Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text('Please fill the input below here',
                          style: kSubTextStyle,
                        ),
                        const SizedBox(height: 35,),
                        ReusableTextField(controller: nameController,labelText: 'Full Name', obsecureText: false, icon: const Icon(Icons.person,)),
                        const SizedBox(height: 20,),
                        ReusableTextField(controller: emailController,labelText: 'Email ID', obsecureText: false, icon: const Icon(Icons.email_outlined,)),
                        const SizedBox(height: 20,),
                        ReusableTextField(controller: mobileController, labelText: 'Mobile No', obsecureText: false, icon: const Icon(Icons.phone_iphone,)),
                        const SizedBox(height: 20,),
                        DropDownMenu(data: lst, controller: stateController),
                        const SizedBox(height: 20,),
                        ReusableTextField(controller:passwordController, labelText: 'Password', obsecureText: true, icon: const Icon(Icons.lock_open_rounded,)),
                        const SizedBox(height: 30,),
                        Center(child:
                          RoundedButton(
                              onPressed: (){
                                authController.register(emailController.text.trim(), passwordController.text.trim(), nameController.text.trim(), stateController.text.trim(), mobileController.text.trim());
                                },
                                text: 'Register'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already registered?", style: kSubTextStyle,),
                            TextButton(
                                onPressed: (){
                                  Get.back();
                                },
                                child: Text('Log In', style: kSubTextStyle.copyWith(color: Colors.blue),))
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
