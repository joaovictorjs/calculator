import 'package:calculator/states/app_theme/app_theme_bloc.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/states/keyboard/keyboard_bloc.dart';
import 'package:calculator/states/keyboard/keyboard_event.dart';
import 'package:calculator/states/keyboard/keyboard_state.dart';
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
  late KeyboardBloc _keyboardBloc;

  @override
  void initState() {
    super.initState();
    _appThemeBloc = AppThemeBloc(AppThemeState(
      theme: LightTheme(),
      isLightTheme: true,
    ));

    _keyboardBloc = KeyboardBloc(KeyboardInitial());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _appThemeBloc),
        BlocProvider.value(value: _keyboardBloc..add(DrawKeyboard.common()))
      ],
      child: SizedBox.expand(
        child: Column(
          children: const [Display(), Expanded(child: Keyboard())],
        ),
      ),
    );
  }
}
