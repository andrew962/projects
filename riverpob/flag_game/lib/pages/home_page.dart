import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/routes/route.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(appRouterProvider).push('/new-game');
            },
            child: const Text("Juego Nuevo")));
  }
}
