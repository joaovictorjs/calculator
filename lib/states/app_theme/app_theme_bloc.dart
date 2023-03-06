import 'package:calculator/states/app_theme/app_theme_event.dart';
import 'package:calculator/states/app_theme/app_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc(AppThemeState initial) : super(initial);

  Future<void> dispose() async => super.close();
}
