import 'package:calculator/states/parentheses/parentheses_event.dart';
import 'package:calculator/states/parentheses/parentheses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParenthesesBloc extends Bloc<ParenthesesEvent, ParenthesesState> {
  ParenthesesBloc() : super(ClosedParentheses()) {
    on<ToggleParentheses>(_toggleParentheses);
    on<ResetParentheses>((event, emit) => emit(ClosedParentheses()));
  }

  void _toggleParentheses(
    ToggleParentheses event,
    Emitter<ParenthesesState> emit,
  ) {
    emit(super.state is ClosedParentheses
        ? OpenedParentheses()
        : ClosedParentheses());
  }
}
