import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/states/display/display_bloc.dart';
import 'package:calculator/states/display/display_state.dart';
import 'package:calculator/states/parentheses/parentheses_bloc.dart';
import 'package:calculator/themes/light_theme.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:calculator/widgets/display.dart';
import 'package:calculator/widgets/keyboard.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppThemeBloc _appThemeBloc;
  late DisplayBloc _displayBloc;
  late ParenthesesBloc _parenthesesBloc;

  @override
  void initState() {
    super.initState();
    _appThemeBloc = AppThemeBloc(AppThemeState(
      theme: LightTheme(),
      isLightTheme: true,
    ));

    _displayBloc = DisplayBloc(DisplayState.initial());
    _parenthesesBloc = ParenthesesBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _appThemeBloc),
        BlocProvider.value(value: _displayBloc),
        BlocProvider.value(value: _parenthesesBloc)
      ],
      child: SizedBox.expand(
        child: Column(
          children: [const Display(), Expanded(child: Keyboard())],
        ),
      ),
    );
  }
}
