import 'package:chef_buddy/constants.dart';
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
        backgroundColor: kBlueAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(text,
          style:  TextStyle(
            fontSize: 15,
            color: kDarkBlue,
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


class RoundedSubButton extends StatelessWidget {
  const RoundedSubButton({super.key, required this.onPressed, required this.text});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: BorderSide(
            color: Colors.grey.shade200,
          ),
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30),
          ),
          // backgroundColor: Colors.grey.shade100,
          // shadowColor: Colors.black,
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(text,
            style:  TextStyle(
              fontSize: 12,
              color: Colors.grey.shade900,
            ),
          ),
        ),
      ),
    );
  }
}

