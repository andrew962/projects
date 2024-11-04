import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_poke/app.dart';
import 'package:flutter_poke/injection.dart';
import 'package:flutter_poke/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  await dotenv.load(fileName: 'env/.env');

  dependencies();

  runApp(const AppView());
}
