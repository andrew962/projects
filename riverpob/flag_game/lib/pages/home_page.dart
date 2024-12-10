// import 'package:flag_game/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// import '../config/routes/route.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey[300])),
            onPressed: () {
              context.push('/new-game');
            },
            child: const Text(
              "Juego Nuevo",
              style: TextStyle(color: Colors.black),
            )));
  }
}
