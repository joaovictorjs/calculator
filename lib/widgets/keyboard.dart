import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appTheme) => Container(
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
        child: Center(),
      ),
    );
  }
}
