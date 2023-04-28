
import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/text_field.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10,),
              Text('Please sign in to continue',
                style: kLogInSubTextStyle,
              ),
              const SizedBox(height: 20,),
              const ReusableTextField(labelText: 'Email ID', obsecureText: false, icon: Icon(Icons.email_outlined),),
              const ReusableTextField(labelText: 'Password', obsecureText: true, icon: Icon(Icons.lock_open_rounded),),
              const SizedBox(height: 30,),
              const Center(
                child: RoundedButton(onPressed:null, text: 'LOGIN'),
              ),
              Center(
                child: TextButton(
                  onPressed: null,
                  child: Text('Forget Password?',
                    style: kLogInSubTextStyle.copyWith(color: const Color(0xFF0df5e3)),),
                ),
              ),
              const SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: kLogInSubTextStyle,),
                  TextButton(
                      onPressed: null,
                      child: Text('Sign up', style: kLogInSubTextStyle.copyWith(color: const Color(0xFF0df5e3)),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Color(0xFF0df5e3)