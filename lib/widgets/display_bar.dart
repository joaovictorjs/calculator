import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_event.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/widgets/display_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayBar extends StatelessWidget {
  const DisplayBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appTheme = BlocProvider.of<AppThemeBloc>(context);

    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child:
          BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, theme) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DisplayButton(
              iconData: theme.isLightTheme
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: theme.theme.text,
              action: () => appTheme.add(ToggleTheme()),
            ),
            DisplayButton(
              iconData: Icons.backspace_outlined,
              action: () {},
              color: theme.isLightTheme ? Colors.red : Colors.red.shade300,
            ),
          ],
        );
      }),
    );
  }
}
