import 'package:calculator/models/display_input.dart';
import 'package:calculator/models/keyboard_item.dart';
import 'package:calculator/models/keyboard_item_type.dart';
import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/display/display_bloc.dart';
import 'package:calculator/states/display/display_event.dart';
import 'package:calculator/states/parentheses/parentheses_bloc.dart';
import 'package:calculator/states/parentheses/parentheses_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton(
      {super.key,
      required this.item,
      required this.height,
      this.beforeAction,
      this.afterAction});
  late KeyboardItem item;
  late double height;
  late VoidCallback? beforeAction;
  late VoidCallback? afterAction;

  @override
  Widget build(BuildContext context) {
    var theme = BlocProvider.of<AppThemeBloc>(context).state.theme;
    var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
    var displayBloc = BlocProvider.of<DisplayBloc>(context);

    return StaggeredGridTile.extent(
      crossAxisCellCount: item.span,
      mainAxisExtent: height,
      child: Material(
        shape: shape,
        color: item.type == KeyboardItemType.numeric
            ? Colors.transparent
            : theme.button,
        child: InkWell(
          onTap: () {
            beforeAction?.call();

            var input = DisplayInput(
              text: item.text,
              value: item.value,
            );

            switch (item.type) {
              case KeyboardItemType.clear:
                displayBloc.add(
                  ClearAllInputs(
                    () => BlocProvider.of<ParenthesesBloc>(context)
                        .add(ResetParentheses()),
                  ),
                );
                break;
              case KeyboardItemType.equals:
                displayBloc.add(PushResult());
                break;
              default:
                displayBloc.add(PushInput(
                  input,
                  item.type == KeyboardItemType.parentheses,
                ));
            }

            afterAction?.call();
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
      ),
    );
  }
}
