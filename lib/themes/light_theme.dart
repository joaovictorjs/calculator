import 'dart:ui';
import 'package:calculator/themes/base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get surface => const Color(0xFFEEEEEE);

  @override
  Color get hover => const Color(0xFFC6C6C6);

  @override
  Color get button => const Color(0xFFE1E1E1);

  @override
  Color get shadow => const Color(0xFFC6C6C6);

  @override
  Color get text => const Color(0xFF121212);
}
