import 'dart:ui';
import 'package:calculator/themes/base_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get background => const Color(0xFF242424);

  @override
  Color get surface => const Color(0xFF121212);

  @override
  Color get hover => const Color(0xFF333333);

  @override
  Color get button => const Color(0xFF202020);

  @override
  Color get shadow => const Color(0xFF060606);

  @override
  Color get text => const Color(0xFFEEEEEE);
}
