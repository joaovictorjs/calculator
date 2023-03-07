import 'package:calculator/states/keyboard/keyboard_event.dart';
import 'package:calculator/states/keyboard/keyboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc(super.initialState) {
    on<DrawKeyboard>((event, emit) => emit(KeyboardReady(event.keys)));
  }
}
