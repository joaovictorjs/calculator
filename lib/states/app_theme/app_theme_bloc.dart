import 'package:calculator/states/app_theme/app_theme_event.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:calculator/themes/dark_theme.dart';
import 'package:calculator/themes/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc(AppThemeState initial) : super(initial) {
    on<ToggleTheme>(_toggleTheme);
  }

  void _toggleTheme(ToggleTheme event, Emitter<AppThemeState> emit) {
    var isLight = super.state.isLightTheme;

    emit(AppThemeState(
      theme: isLight ? DarkTheme() : LightTheme(),
      isLightTheme: !isLight,
    ));
  }

  Future<void> dispose() async => super.close();
}
