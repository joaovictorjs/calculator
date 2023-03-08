import 'package:calculator/models/keyboard_item.dart';
import 'package:calculator/models/keyboard_item_type.dart';
import 'package:calculator/states/parentheses/parentheses_bloc.dart';
import 'package:calculator/states/parentheses/parentheses_event.dart';
import 'package:calculator/states/parentheses/parentheses_state.dart';
import 'package:calculator/widgets/keyboard_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParenthesesButton extends StatelessWidget {
  ParenthesesButton({super.key, required this.item, required this.height});
  late KeyboardItem item;
  late double height;
  @override
  Widget build(BuildContext context) {
    var parenthesesBloc = BlocProvider.of<ParenthesesBloc>(context);

    return BlocBuilder<ParenthesesBloc, ParenthesesState>(
      builder: (context, state) {
        item = KeyboardItem.value(
          value: state is ClosedParentheses ? "(" : ")",
          type: KeyboardItemType.parentheses,
        );

        return KeyboardButton(
          item: item,
          height: height,
          afterAction: () => parenthesesBloc.add(ToggleParentheses()),
        );
      },
    );
  }
}
