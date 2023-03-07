import 'package:calculator/models/keyboard_item_type.dart';

class KeyboardItem {
  late KeyboardItemType type;
  late String text, value;
  late int span;

  KeyboardItem({
    required this.type,
    required this.text,
    required this.value,
    this.span = 1,
  });

  KeyboardItem.numeric(this.value) {
    text = value;
    span = 1;
    type = KeyboardItemType.numeric;
  }

  KeyboardItem.value({
    required this.value,
    this.span = 1,
    required this.type,
  }) {
    text = value;
  }

  KeyboardItem.basicOperation({required this.value, this.span = 1}) {
    text = value;
    type = KeyboardItemType.basicOperation;
  }
}
