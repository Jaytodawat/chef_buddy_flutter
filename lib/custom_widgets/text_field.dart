import 'package:chef_buddy/constants.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, required this.labelText, required this.obsecureText, this.icon});
  final String labelText;
  final bool obsecureText;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        style:  TextStyle(
          color: kWhite,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFaintBlue),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFaintWhite,),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: kFaintBlue,
          filled: true,
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.white60,
              fontSize: 13
          ),
        ),
      ),
    );
  }
}
//Color(0xFF1D1E33)
