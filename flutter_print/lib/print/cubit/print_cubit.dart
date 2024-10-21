import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'print_state.dart';

class PrintCubit extends Cubit<PrintState> {
  PrintCubit() : super(const PrintState(text: ''));

  void print(String text) {
    emit(state.copyWith(text: text));
  }
}
