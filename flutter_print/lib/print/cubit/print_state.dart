part of 'print_cubit.dart';

class PrintState extends Equatable {
  const PrintState({this.text = ''});
  final String text;

  @override
  List<Object?> get props => [text];

  PrintState copyWith({String? text}) {
    return PrintState(text: text ?? this.text);
  }
}
