import 'package:chef_buddy/constants.dart';
import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({Key? key, required this.iconData, required this.text, this.iconColor}) : super(key: key);
  final IconData iconData;
  final Color? iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: iconColor,),
        Text(text, style: kSubTextStyle.copyWith(fontSize: 13), )
      ],
    );
  }
}
