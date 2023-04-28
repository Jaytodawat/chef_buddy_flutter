import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconButton(onPressed: null, icon: Icon(Icons.arrow_back_rounded, color: Colors.white60, size: 30,), padding: EdgeInsets.all(0),),
              const SizedBox(height: 20,),
              const Text('Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 5,),
              Text('Please fill the input below here',
                style: kLogInSubTextStyle,
              ),
              const SizedBox(height: 35,),
              const ReusableTextField(labelText: 'Full Name', obsecureText: false, icon: Icon(Icons.person,)),
              const SizedBox(height: 20,),
              const ReusableTextField(labelText: 'Email ID', obsecureText: false, icon: Icon(Icons.email_outlined,)),
              const SizedBox(height: 20,),
              const ReusableTextField(labelText: 'Mobile No', obsecureText: false, icon: Icon(Icons.phone_iphone,)),
              const SizedBox(height: 20,),
              const ReusableTextField(labelText: 'State', obsecureText: false, icon: Icon(Icons.location_on_outlined)),
              const SizedBox(height: 20,),
              const ReusableTextField(labelText: 'Password', obsecureText: true, icon: Icon(Icons.lock_open_rounded,)),
              const SizedBox(height: 30,),
              const Center(child: RoundedButton(onPressed: null, text: 'Register')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already registered?", style: kLogInSubTextStyle,),
                  TextButton(
                      onPressed: null,
                      child: Text('Log In', style: kLogInSubTextStyle.copyWith(color: const Color(0xFF0df5e3)),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
