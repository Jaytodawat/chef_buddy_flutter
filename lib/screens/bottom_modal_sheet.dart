import 'package:flutter/material.dart';

import '../custom_widgets/drop_down.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DropDownMenu(),
        DropDownMenu(),
        DropDownMenu(),
        DropDownMenu(),
        DropDownMenu(),
        DropDownMenu(),
      ],
    );
  }
}
