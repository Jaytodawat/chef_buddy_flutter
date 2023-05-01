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
  List<String> lst = ['Maharashtra', 'Gujrat', 'Goa', 'UP', 'MP', 'Mizoram', 'Nagaland', 'Kerala'];
  String? dropdownValue = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text('Please fill the input below here',
                    style: kSubTextStyle,
                  ),
                  const SizedBox(height: 35,),
                  const ReusableTextField(labelText: 'Full Name', obsecureText: false, icon: Icon(Icons.person,)),
                  const SizedBox(height: 20,),
                  const ReusableTextField(labelText: 'Email ID', obsecureText: false, icon: Icon(Icons.email_outlined,)),
                  const SizedBox(height: 20,),
                  const ReusableTextField(labelText: 'Mobile No', obsecureText: false, icon: Icon(Icons.phone_iphone,)),
                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DropdownButtonFormField<String>(
                        alignment: Alignment.bottomCenter,
                        isExpanded: true,
                        dropdownColor: kFaintBlue,
                        value: dropdownValue,
                        decoration:  InputDecoration(
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kFaintBlue),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color:kFaintWhite,),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          fillColor: kFaintBlue,
                          filled: true,
                          labelText: 'State',
                          labelStyle: const TextStyle(
                              color: Colors.white60,
                              fontSize: 13
                          ),
                        ),
                        items: lst.map((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                            value,
                            style: TextStyle(color: kWhite),
                            ),
                            );
                          }).toList(),
                        onChanged:(String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const ReusableTextField(labelText: 'Password', obsecureText: true, icon: Icon(Icons.lock_open_rounded,)),
                  const SizedBox(height: 30,),
                  Center(child: RoundedButton(onPressed: (){
                    Navigator.pop(context);
                  }, text: 'Register')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already registered?", style: kSubTextStyle,),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text('Log In', style: kSubTextStyle.copyWith(color: const Color(0xFF0df5e3)),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
