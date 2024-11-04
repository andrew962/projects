import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_print_string/app.dart';
import 'package:flutter_print_string/print_observer.dart';

void main() {
  Bloc.observer = PrintObserver();
  runApp(const App());
}
