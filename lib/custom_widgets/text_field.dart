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
        style: const TextStyle(
          color: Colors.white,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1D1E33)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white60),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: const Color(0xFF1D1E33),
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
