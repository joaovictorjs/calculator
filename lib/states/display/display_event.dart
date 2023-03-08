import 'package:calculator/models/display_input.dart';
import 'package:flutter/widgets.dart';

abstract class DisplayEvent {}

class PushInput extends DisplayEvent {
  late DisplayInput input;
  late bool isParentheses;

  PushInput(this.input, this.isParentheses);
}

class RemoveLastInput extends DisplayEvent {
  late VoidCallback whenLastIsParentheses;

  RemoveLastInput({required this.whenLastIsParentheses});
}

class ClearAllInputs extends DisplayEvent {
  late VoidCallback callback;
  ClearAllInputs(this.callback);
}

class PushResult extends DisplayEvent {}

class PushResultToClipboard extends DisplayEvent {}
