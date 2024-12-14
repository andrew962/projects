import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flag_game/providers/providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewGamePage extends ConsumerStatefulWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  bool disableButtons = false;
  bool loadingImg = false;
  int bestScoreLocal = 0;
  int bestScoreGlobal = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void gameOver() {
    context.pop();
  }

  Future<void> setBestScore() async {
    final prefs = await sharedPreferences();
    var score = prefs.getInt('bestScore') ?? 0;
    if (bestScoreLocal > score) {
      prefs.setInt('bestScore', bestScoreLocal);
    }
  }

  @override
  Widget build(BuildContext context) {
    final newGameFutureP = ref.watch(gameFutureProvider);
    final gameStateP = ref.watch(gameProvider);

    ref.listen(gameFutureProvider, (previous, next) async {
      if (next is AsyncData) {
        ref.read(gameProvider.notifier).currentGame(next.value!);
      }
      final prefs = await sharedPreferences();
      var score = prefs.getInt("bestScore") ?? 0;
      setState(() {
        bestScoreGlobal = score;
      });
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Center(child: Text("Adivina la Bandera")),
        ),
        body: newGameFutureP.when(
          data: (dataGame) {
            final newQuestionP =
                ref.watch(newQuestionFutureProvider(gameStateP.gameId));
            ref.listen(newQuestionFutureProvider(gameStateP.gameId),
                (previous, next) {
              if (previous!.value?.questionId != next.value?.questionId) {
                setState(() {
                  disableButtons = false;
                });
              }
            });
            if (newQuestionP.hasValue) {
              return newQuestionP.maybeWhen(
                data: (dataQuestion) {
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
                                        'Mejor puntaje $bestScoreLocal ${bestScoreLocal > bestScoreGlobal ? "" : "/ $bestScoreGlobal"}',
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    Text(
                                      ' ${gameStateP.lives}',
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                  ],
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
                              dataQuestion.country.urlImage!,
                            ),
                          ),
                        ),
                        Column(
                          children: dataQuestion.answers
                              .map((e) => Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.grey[100])),
                                            onPressed: disableButtons
                                                ? null
                                                : () async {
                                                    loadingImg = true;
                                                    bool isGameOver = false;
                                                    setState(() {
                                                      disableButtons = true;
                                                    });
                                                    String msg = "Correcto";
                                                    String gameOverText =
                                                        "Juego Terminado";
                                                    String correctAnsw = '';
                                                    bool isCorrect = e.id ==
                                                        dataQuestion
                                                            .correctAnswer;
                                                    if (!isCorrect) {
                                                      msg = "Incorrecto";
                                                      correctAnsw = dataQuestion
                                                          .country.countryName;
                                                      ref
                                                          .read(gameProvider
                                                              .notifier)
                                                          .decrementLives();
                                                      isGameOver =
                                                          gameStateP.lives - 1 <
                                                              1;
                                                    } else {
                                                      setState(() {
                                                        bestScoreLocal =
                                                            bestScoreLocal + 1;
                                                      });
                                                    }
                                                    debugPrint('$isGameOver');
                                                    if (isGameOver) {
                                                      setBestScore();
                                                    }
                                                    showModalBottomSheet(
                                                      useSafeArea: true,
                                                      isDismissible: false,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          height: 230,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    msg,
                                                                    style: TextStyle(
                                                                        color: isCorrect
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .red,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            40),
                                                                  )
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                        correctAnsw,
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 30))
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                  visible:
                                                                      isGameOver,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          gameOverText,
                                                                          style:
                                                                              const TextStyle(fontSize: 30))
                                                                    ],
                                                                  )),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                      child: ElevatedButton(
                                                                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                                                          onPressed: () {
                                                                            if (isGameOver) {
                                                                              context.replace('/');
                                                                            } else {
                                                                              ref.invalidate(newQuestionFutureProvider);
                                                                            }
                                                                            if (context.canPop()) {
                                                                              context.pop();
                                                                            }
                                                                          },
                                                                          child: Text(
                                                                            isGameOver
                                                                                ? 'Inicio'
                                                                                : 'Siguiente',
                                                                            style:
                                                                                const TextStyle(color: Colors.white),
                                                                          )),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Visibility(
                                                                      visible:
                                                                          isGameOver,
                                                                      child:
                                                                          Expanded(
                                                                        child: ElevatedButton(
                                                                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                                                            onPressed: () {
                                                                              ref.invalidate(gameFutureProvider);
                                                                              context.pop();
                                                                            },
                                                                            child: const Text(
                                                                              'Reintentar',
                                                                              style: TextStyle(color: Colors.white),
                                                                            )),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                            child: Text(
                                              e.countryName,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            )),
                                      ),
                                    ],
                                  ))
                              .toList(),
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
