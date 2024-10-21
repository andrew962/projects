part of 'print_cubit.dart';

@immutable
sealed class PrintState extends Equatable {
  const PrintState(this.text);
  final String text;

  @override
  List<Object?> get props => [text];
}

final class PrintInitial extends PrintState {
  const PrintInitial(super.text);
}
