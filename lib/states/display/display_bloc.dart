import 'package:calculator/models/display_input.dart';
import 'package:calculator/states/display/display_event.dart';
import 'package:calculator/states/display/display_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {
  final _parser = Parser();
  final _context = ContextModel();

  DisplayBloc(super.initialState) {
    on<PushInput>(_pushInput);
    on<RemoveLastInput>(_removeLastInput);
    on<ClearAllInputs>(_clearAllInputs);
    on<PushResult>(_pushResult);
    on<PushResultToClipboard>(_pushResultToClipboard);

    on((event, emit) {
      _updateExpression(emit);
      _solveExpression(emit);
    });
  }

  void _pushInput(PushInput event, Emitter<DisplayState> emit) {
    if (super.state.expression == "0+0") {
      state.inputs = [event.input];
    } else {
      if (event.isParentheses && event.input.value == "(") {
        _parenthesesResolver(emit);
      } else {
        state.inputs.add(event.input);
      }
    }
  }

  void _updateExpression(Emitter<DisplayState> emit) {
    var humanRedeable = "";
    for (var element in state.inputs) {
      humanRedeable += element.text;
    }
    emit(state.copyWith(expression: humanRedeable));
  }

  void _removeLastInput(RemoveLastInput event, Emitter<DisplayState> emit) {
    if (super.state.inputs.last.value == "(" ||
        super.state.inputs.last.value == ")") {
      event.whenLastIsParentheses();
    }

    if (super.state.inputs.length == 1) {
      emit(DisplayState.initial());
    } else {
      super.state.inputs.removeLast();
    }
  }

  void _solveExpression(Emitter<DisplayState> emit) {
    String expression = "";

    for (var element in super.state.inputs) {
      expression += element.value;
    }

    try {
      var math = _parser.parse(expression);
      var res = math.evaluate(EvaluationType.REAL, _context).toString();

      if (res.endsWith(".0")) {
        res = res.replaceAll(".0", "");
      } else {
        res = double.parse(res).toStringAsFixed(2);
      }

      emit(super.state.copyWith(result: "= $res"));
      // ignore: unused_catch_clause
    } on FormatException catch (e) {
      // ignore: unused_catch_clause, empty_catches
    } on ArgumentError catch (e) {}
  }

  void _clearAllInputs(ClearAllInputs event, Emitter<DisplayState> emit) {
    emit(DisplayState.initial());
    event.callback();
  }

  void _pushResult(PushResult event, Emitter<DisplayState> emit) {
    if (super.state.expression == "0+0" && super.state.result == "= 0") return;

    var raw = state.result.replaceFirst("= ", "").split("");
    List<DisplayInput> inputs = [];

    for (var i in raw) {
      inputs.add(DisplayInput(text: i, value: i));
    }

    emit(super.state.copyWith(inputs: inputs));
  }

  void _parenthesesResolver(Emitter<DisplayState> emit) {
    var last = super.state.inputs.last.value;
    if (last != "-" && last != "+" && last != "/" && last != "*") {
      var inputs = [
        DisplayInput(text: "×", value: "*"),
        DisplayInput(text: "(", value: "("),
      ];

      super.state.inputs.addAll(inputs);
    } else {
      super.state.inputs.add(DisplayInput(text: "(", value: "("));
    }
  }

  void _pushResultToClipboard(
      PushResultToClipboard event, Emitter<DisplayState> emit) {
    var data = ClipboardData(text: super.state.result.replaceFirst("= ", ""));
    Clipboard.setData(data).then((value) => null);
  }
}
