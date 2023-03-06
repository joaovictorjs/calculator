import 'package:calculator/themes/base_theme.dart';

class AppThemeState {
  late BaseTheme theme;
  late bool isLightTheme;

  AppThemeState({required this.theme, required this.isLightTheme});

  AppThemeState copyWith({
    BaseTheme? theme,
    bool? isLightTheme,
  }) =>
      AppThemeState(
        theme: theme ?? this.theme,
        isLightTheme: isLightTheme ?? this.isLightTheme,
      );
}
