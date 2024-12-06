import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flag_game/providers/providers.dart';

class NewGamePage extends ConsumerStatefulWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  bool disableButtons = false;
  bool loadingImg = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newGameP = ref.watch(newGameProvider);
    return newGameP.when(
      data: (dataG) {
        final newQuestionP = ref.watch(newQuestionProvider(dataG.item!.gameId));
        if (newQuestionP.hasValue) {
          return newQuestionP.maybeWhen(
            data: (dataQ) {
              // loadingImg = false;
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 310,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          dataQ.item!.country.urlImage!,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: dataQ.item!.answers.length,
                          itemBuilder: (context, index) {
                            var answer = dataQ.item!.answers[index];
                            return ElevatedButton(
                                onPressed: disableButtons
                                    ? null
                                    : () async {
                                        loadingImg = true;
                                        setState(() {
                                          disableButtons = true;
                                        });
                                        String msg = "Incorrecto era";
                                        if (answer.id ==
                                            dataQ.item!.correctAnswer) {
                                          msg = "Correcto";
                                        }
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '$msg ${dataQ.item?.country.countryName}.',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            duration:
                                                const Duration(seconds: 3),
                                          ),
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 3500));
                                        ref.invalidate(newQuestionProvider);
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        setState(() {
                                          disableButtons = false;
                                        });
                                      },
                                child: Text(answer.countryName));
                          }),
                    )
                  ],
                ),
              );
            },
            orElse: () {
              return const Text('Error Question');
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) => const Center(
        child: Text("Error Game"),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
