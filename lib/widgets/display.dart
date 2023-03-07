import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/widgets/display_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appTheme) => Container(
        color: appTheme.theme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [
            Expanded(child: Center()),
            DisplayBar(),
          ],
        ),
      ),
    );
  }
}
