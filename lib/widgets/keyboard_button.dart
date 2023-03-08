import 'package:calculator/models/keyboard_item.dart';
import 'package:calculator/models/keyboard_item_type.dart';
import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/keyboard/keyboard_bloc.dart';
import 'package:calculator/states/keyboard/keyboard_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({super.key, required this.item, required this.height});
  late KeyboardItem item;
  late double height;

  @override
  Widget build(BuildContext context) {
    var theme = BlocProvider.of<AppThemeBloc>(context).state.theme;
    var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

    return StaggeredGridTile.extent(
        crossAxisCellCount: item.span,
        mainAxisExtent: height,
        child: Material(
          shape: shape,
          color: item.type == KeyboardItemType.numeric
              ? Colors.transparent
              : theme.button,
          child: InkWell(
            onTap: () => {
              //if item is parentheses -> replaceParentheses item and updates display, else updates display
            },
            customBorder: shape,
            hoverColor: theme.hover,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Center(
              child: Text(
                item.text,
                style: TextStyle(
                  color: theme.text,
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
