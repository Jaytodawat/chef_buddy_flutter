import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.onPressed, required this.text});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        backgroundColor: const Color(0xFF0df5e3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(text,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF111328),
          ),
        ),
      ),
    );
  }
}

class TextClick extends StatelessWidget {
  const TextClick({super.key, required this.onPressed, required this.text, this.style});
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text('Forget Password?',
        style: style,),
    );
  }
}

