import 'package:calculator/models/keyboard_item.dart';
import 'package:calculator/models/keyboard_item_type.dart';
import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/states/display/display_bloc.dart';
import 'package:calculator/states/display/display_state.dart';
import 'package:calculator/widgets/keyboard_button.dart';
import 'package:calculator/widgets/parentheses_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Keyboard extends StatelessWidget {
  Keyboard({super.key});

  final keys = [
    //line 0
    KeyboardItem.value(
      type: KeyboardItemType.clear,
      value: "CE",
      span: 2,
    ),
    KeyboardItem.value(type: KeyboardItemType.parentheses, value: "("),

    KeyboardItem(
      type: KeyboardItemType.basicOperation,
      text: "÷",
      value: "/",
    ),

    //line 1
    KeyboardItem.numeric("7"),
    KeyboardItem.numeric("8"),
    KeyboardItem.numeric("9"),
    KeyboardItem(type: KeyboardItemType.basicOperation, text: "×", value: "*"),

    //line 2
    KeyboardItem.numeric("4"),
    KeyboardItem.numeric("5"),
    KeyboardItem.numeric("6"),
    KeyboardItem.basicOperation(value: "-"),

    //line 3
    KeyboardItem.numeric("1"),
    KeyboardItem.numeric("2"),
    KeyboardItem.numeric("3"),
    KeyboardItem.basicOperation(value: "+"),

    //line 4
    KeyboardItem.numeric("."),
    KeyboardItem.numeric("0"),
    KeyboardItem.value(value: "=", type: KeyboardItemType.equals, span: 2),
    KeyboardItem.basicOperation(value: "+"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appTheme) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: appTheme.theme.background,
          boxShadow: [
            BoxShadow(
              color: appTheme.theme.shadow,
              offset: const Offset(0, -2),
              blurRadius: 10,
            )
          ],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          var height = (constraints.maxHeight - 20) / 5;
          return StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            axisDirection: AxisDirection.down,
            children: List.generate(
              keys.length,
              (index) {
                var item = keys[index];

                if (item.type == KeyboardItemType.parentheses) {
                  return ParenthesesButton(item: item, height: height);
                } else {
                  return KeyboardButton(
                    item: keys[index],
                    height: height,
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
