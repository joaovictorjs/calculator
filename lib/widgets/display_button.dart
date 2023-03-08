import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayButton extends StatelessWidget {
  DisplayButton({
    super.key,
    required this.iconData,
    required this.action,
    required this.color,
  });
  late IconData iconData;
  late VoidCallback action;
  late Color color;
  var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    var theme = BlocProvider.of<AppThemeBloc>(context).state.theme;

    return SizedBox(
      height: 30,
      width: 30,
      child: Material(
        shape: shape,
        color: Colors.transparent,
        child: InkWell(
          onTap: action,
          customBorder: shape,
          hoverColor: theme.hover,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: Icon(
              iconData,
              size: 16,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
