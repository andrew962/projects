import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke/poke/bloc/poke_bloc.dart';
import 'package:flutter_poke/poke/view/poke_page.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PokeBloc(),
        child: const PokePage(),
      ),
    );
  }
}
