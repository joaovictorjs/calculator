import 'package:calculator/models/keyboard_item_type.dart';

class KeyboardItem {
  late KeyboardItemType type;
  late String text, value;
  late int span;

  KeyboardItem({
    required this.type,
    required this.text,
    required this.value,
    required this.span,
  });
}
