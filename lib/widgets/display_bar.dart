import 'package:calculator/widgets/display_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisplayBar extends StatelessWidget {
  const DisplayBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DisplayButton(iconData: Icons.light_mode_outlined, action: () {}),
          DisplayButton(iconData: Icons.backspace_outlined, action: () {}),
        ],
      ),
    );
  }
}
