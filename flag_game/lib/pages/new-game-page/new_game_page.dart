import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services.dart';

class NewGamePage extends ConsumerStatefulWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  GameService gameService = GameService();
  bool disableButtons = false;
  bool loadingImg = false;
  int bestScoreLocal = 0;
  int bestScoreGlobal = 0;
  int lives = 0;
  QuestionResponseModel questionResponse = QuestionResponseModel();

  @override
  void initState() {
    super.initState();
    newGame();
  }

  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void newGame() {
    setupGame();
    newQuestion();
    getBestScore();
  }

  void setupGame() {
    setState(() {
      lives = 5;
    });
  }

  void gameOver() {
    context.pop();
  }

  void newQuestion() async {
    final r = await gameService.newQuestion(QuestionParamsModel());
    setState(() {
      questionResponse = r;
      disableButtons = false;
    });
  }

  void validateAnswer(CountryItemModel el) {
    loadingImg = true;
    bool isGameOver = false;
    setState(() {
      disableButtons = true;
    });
    String msg = "Correcto";
    String gameOverText = "Juego Terminado";
    String correctAnsw = '';
    bool isCorrect = el.id == questionResponse.correctAnswer?.id;
    if (!isCorrect) {
      msg = "Incorrecto";
      correctAnsw = questionResponse.correctAnswer!.countryName;
      lives -= 1;
    } else {
      setState(() {
        bestScoreLocal += 1;
      });
    }
    isGameOver = lives == 0;
    if (isGameOver) {
      setBestScore();
    }
    showModalBottomSheet(
      useSafeArea: true,
      isDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 230,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg,
                    style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(correctAnsw,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30))
                  ],
                ),
              ),
              Visibility(
                  visible: isGameOver,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(gameOverText, style: const TextStyle(fontSize: 30))
                    ],
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          onPressed: () {
                            if (isGameOver) {
                              setBestScore();
                              context.replace('/');
                            } else {
                              newQuestion();
                            }
                            if (context.canPop()) {
                              context.pop();
                            }
                          },
                          child: Text(
                            isGameOver ? 'Inicio' : 'Siguiente',
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: isGameOver,
                      child: Expanded(
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                            onPressed: () {
                              newGame();
                              setBestScore();
                              setState(() {
                                bestScoreLocal = 0;
                              });
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
  }

  Future<void> setBestScore() async {
    final prefs = await sharedPreferences();
    var score = prefs.getInt('bestScore') ?? 0;
    if (bestScoreLocal > score) {
      prefs.setInt('bestScore', bestScoreLocal);
    }
  }

  Future<void> getBestScore() async {
    final prefs = await sharedPreferences();
    var score = prefs.getInt('bestScore') ?? 0;
    setState(() {
      bestScoreGlobal = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Center(child: Text("Adivina la Bandera")),
        ),
        body: Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            ' $lives',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Visibility(
                    visible: questionResponse.correctAnswer != null,
                    child: Image.network(
                      questionResponse.correctAnswer?.urlImage ?? '',
                    ),
                  ),
                ),
              ),
              Column(
                children: questionResponse.questions
                        ?.map((e) => Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.grey[100])),
                                    onPressed: disableButtons
                                        ? null
                                        : () {
                                            validateAnswer(e);
                                          },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        e.countryName,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        .toList() ??
                    [],
              )
            ],
          ),
        ));
  }
}
