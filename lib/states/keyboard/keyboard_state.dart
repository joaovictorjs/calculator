import 'package:calculator/models/keyboard_item.dart';

abstract class KeyboardState {}

class KeyboardInitial extends KeyboardState {}

class KeyboardReady extends KeyboardState {
  late List<KeyboardItem> keys;

  KeyboardReady(this.keys);
}
