import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke/poke/bloc/poke_bloc.dart';

class PokePage extends StatefulWidget {
  const PokePage({super.key});

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  @override
  void initState() {
    super.initState();
    // _press();
  }

  void _press() {
    context.read<PokeBloc>().add(PokeFetched());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokeBloc, PokeState>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        _press();
                      },
                      child: const Text("Press")),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
