// import 'package:flutter/cupertino.dart';
import 'package:data/data.dart';
import 'package:data/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flag_game/providers/providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class NewGamePage extends ConsumerStatefulWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  bool disableButtons = false;
  bool loadingImg = false;
  int goodAnswers = 0;
  NewGameItemResponseModel game = NewGameItemResponseModel();
  int lives = 5;

  @override
  void initState() {
    super.initState();
  }

  void gameOver() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final newGameP = ref.watch(gameProvider);
    // final gameStateP = ref.watch(gameStateProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Center(child: Text("Flag Game")),
        ),
        body: newGameP.when(
          data: (dataG) {
            game = dataG.item!;
            // lives = dataG.item!.lives;
            final newQuestionP = ref.watch(newQuestionProvider(game.gameId));
            if (newQuestionP.hasValue) {
              return newQuestionP.maybeWhen(
                data: (dataQ) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Racha: $goodAnswers',
                                        style: const TextStyle(fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.solidHeart,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      Text(
                                        ' $lives',
                                        style: const TextStyle(fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 320,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.network(
                              dataQ.country.urlImage!,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: dataQ.answers.length,
                              itemBuilder: (context, index) {
                                var answer = dataQ.answers[index];
                                return ElevatedButton(
                                    onPressed: disableButtons
                                        ? null
                                        : () async {
                                            loadingImg = true;
                                            setState(() {
                                              disableButtons = true;
                                            });
                                            String msg = "Correcto ";
                                            if (!(answer.id ==
                                                dataQ.correctAnswer)) {
                                              setState(() {
                                                lives = lives - 1;
                                              });
                                              if (lives < 1) {
                                                msg = "Juego terminado";
                                              } else {
                                                msg = "Incorrecto era ";
                                              }
                                            } else {
                                              setState(() {
                                                goodAnswers = goodAnswers + 1;
                                              });
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '$msg${lives >= 1 ? dataQ.country.countryName : ''}.',
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                                duration:
                                                    const Duration(seconds: 3),
                                              ),
                                            );

                                            await Future.delayed(const Duration(
                                                milliseconds: 3500));
                                            if (lives < 1) {
                                              gameOver();
                                            } else {
                                              ref.invalidate(
                                                  newQuestionProvider);
                                              await Future.delayed(
                                                  const Duration(seconds: 1));
                                              setState(() {
                                                disableButtons = false;
                                              });
                                            }
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
        ));
  }
}
