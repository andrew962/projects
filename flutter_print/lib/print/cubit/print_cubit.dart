import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'print_state.dart';

class PrintCubit extends Cubit<String> {
  PrintCubit() : super('');

  void print(String text) {
    emit(text);
  }
}
