import 'package:calculator/models/keyboard_item.dart';
import 'package:calculator/models/keyboard_item_type.dart';

abstract class KeyboardEvent {}

class DrawKeyboard extends KeyboardEvent {
  late List<KeyboardItem> keys;

  DrawKeyboard(this.keys);

  DrawKeyboard.common() {
    keys = [
      //line 0
      KeyboardItem.value(
        type: KeyboardItemType.clear,
        value: "CE",
        span: 2,
      ),
      KeyboardItem.value(type: KeyboardItemType.parentheses, value: "("),

      KeyboardItem(
        type: KeyboardItemType.basicOperation,
        text: "÷",
        value: "/",
      ),

      //line 1
      KeyboardItem.numeric("7"),
      KeyboardItem.numeric("8"),
      KeyboardItem.numeric("9"),
      KeyboardItem(
          type: KeyboardItemType.basicOperation, text: "×", value: "*"),

      //line 2
      KeyboardItem.numeric("4"),
      KeyboardItem.numeric("5"),
      KeyboardItem.numeric("6"),
      KeyboardItem.basicOperation(value: "-"),

      //line 3
      KeyboardItem.numeric("1"),
      KeyboardItem.numeric("2"),
      KeyboardItem.numeric("3"),
      KeyboardItem.basicOperation(value: "+"),

      //line 4
      KeyboardItem.numeric("."),
      KeyboardItem.numeric("0"),
      KeyboardItem.value(value: "=", type: KeyboardItemType.equals, span: 2),
      KeyboardItem.basicOperation(value: "+"),
    ];
  }
}

class ReplaceKeyboardItem extends KeyboardEvent {
  late KeyboardItem old, replacement;

  ReplaceKeyboardItem({required this.old, required this.replacement});
}
