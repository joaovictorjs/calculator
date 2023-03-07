import 'package:flutter/material.dart';

class DisplayButton extends StatelessWidget {
  DisplayButton({super.key, required this.iconData, required this.action});
  late IconData iconData;
  late VoidCallback action;
  var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Material(
        shape: shape,
        color: Colors.transparent,
        child: InkWell(
          onTap: action,
          customBorder: shape,
          child: Center(child: Icon(iconData, size: 16)),
        ),
      ),
    );
  }
}
