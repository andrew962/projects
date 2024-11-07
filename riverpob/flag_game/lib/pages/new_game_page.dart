import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flag_game/providers/providers.dart';

class NewGamePage extends ConsumerStatefulWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  @override
  void initState() {
    super.initState();
    ref.read(newGameProvider);
  }

  @override
  Widget build(BuildContext context) {
    final newGame = ref.watch(newGameProvider);
    // final newGameData = ref.watch(newGameDataProvider);
    return newGame.when(
      data: (data) {
        print(data.gameId);
        print(data.toJson());
        return Column(
          children: [
            Text(
              data.country.countryName,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              data.gameId,
            ),
            Image.network(data.country.urlImage!),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  var answer = data.answers[i];
                  return ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white54)),
                      onPressed: () {
                        print(answer.id);
                      },
                      child: Text(answer.countryName));
                },
                itemCount: data.answers.length,
              ),
            )
          ],
        );
      },
      error: (error, stackTrace) => const Text("Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
