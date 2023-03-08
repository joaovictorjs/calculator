import 'dart:async';

import 'package:calculator/models/display_input.dart';

class DisplayState {
  late String result;
  late String expression;
  late List<DisplayInput> inputs;

  DisplayState(
      {required this.expression, required this.result, required this.inputs});

  DisplayState.initial() {
    inputs = [
      DisplayInput.zero(),
      DisplayInput(text: "+", value: "+"),
      DisplayInput.zero()
    ];

    expression = "0+0";
    result = "= 0";
  }

  DisplayState copyWith({
    String? result,
    String? expression,
    List<DisplayInput>? inputs,
  }) =>
      DisplayState(
        result: result ?? this.result,
        expression: expression ?? this.expression,
        inputs: inputs ?? this.inputs,
      );
}
