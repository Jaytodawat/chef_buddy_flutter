import 'package:flutter/material.dart';

import '../constants.dart';

class IconBox extends StatelessWidget {
  IconBox({super.key, required this.onPressed, required this.icon, this.boxColor, this.iconColor});
  void Function()? onPressed;
  IconData icon;
  Color? boxColor;
  Color? iconColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: boxColor,
      ),
      child:  IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: 20,),
      ),
    );
  }
}
