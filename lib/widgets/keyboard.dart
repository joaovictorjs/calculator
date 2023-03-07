import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/states/keyboard/keyboard_bloc.dart';
import 'package:calculator/states/keyboard/keyboard_state.dart';
import 'package:calculator/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

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
          return BlocBuilder<KeyboardBloc, KeyboardState>(
            builder: (context, state) {
              return StaggeredGrid.count(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                axisDirection: AxisDirection.down,
                children: List.generate(
                  (state as KeyboardReady).keys.length,
                  (index) => KeyboardButton(
                    item: state.keys[index],
                    height: height,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
