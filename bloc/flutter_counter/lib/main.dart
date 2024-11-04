import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/observer/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
