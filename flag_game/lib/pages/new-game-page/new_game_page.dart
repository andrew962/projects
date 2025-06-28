import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:data/data.dart';
import 'package:flag_game/widgets/animated_button.widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

import '../../services/services.dart';

class NewGamePage extends StatefulHookConsumerWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  GameService gameService = GameService();
  bool showNextQuestionButton = false;
  bool disableButtons = false;
  bool loadingImg = false;
  int bestScoreLocal = 0;
  int bestScoreGlobal = 0;
  int lives = 5;
  bool enabledOptions = true;
  QuestionModel question = QuestionModel(correctAnswer: FlagItemModel());
  final CountDownController _controller = CountDownController();
  final backgroundColor = const Color(0xFF5DA6A7);
  bool hasTimedOut = false;
  List<Color> colors = [
    const Color(0xFFA8DADC),
    const Color(0xFFB8E2C8),
    const Color(0xFFCDB4DB),
    const Color(0xFFFFF1A6),
    const Color(0xFFFFB5B5),
    const Color(0xFFFFCBCB),
    const Color(0xFFB5D5FF),
    const Color(0xFFFFDAB9),
    const Color(0xFFB5EAD7),
    const Color(0xFFF1F1F1),
  ];

  @override
  void initState() {
    super.initState();
    newGame();
  }

  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void newGame() {
    _setupGame();
    _newQuestion();
    _getBestScore();
  }

  void _setupGame() {
    setState(() {
      lives = 5;
    });
  }

  // void _gameOver() {
  //   context.pop();
  // }

  void _newQuestion() async {
    QuestionModel newQuestion = await gameService.newQuestion();
    setState(() {
      disableButtons = false;
      question = newQuestion;
    });
    _controller.start();
  }

  void _validateAnswer(
    int selectedID, {
    bool isTimeout = false,
    bool showCorrectAnswer = false,
  }) async {
    setState(() {
      enabledOptions = false;
      hasTimedOut = isTimeout;
      showNextQuestionButton = true;
      if (!isTimeout) {
        _controller.pause();
      }

      question = question.copyWith(
        options: question.options.map((element) {
          if ((selectedID == element.id) ||
              (showCorrectAnswer && question.correctAnswer.id == element.id)) {
            if (!hasTimedOut) {
              gameService.deleteFlagID(selectedID);
            }
            return element.copyWith(
              showBadge: true,
              isCorrect: showCorrectAnswer
                  ? question.correctAnswer.id == element.id
                  : question.correctAnswer.id == selectedID,
            );
          }
          return element.copyWith(
            showBadge: isTimeout ? true : false,
            isCorrect: false,
          );
        }).toList(),
      );
    });

    // await showModalBottomSheet(
    //   backgroundColor: Colors.transparent,
    //   barrierColor: Colors.transparent,
    //   elevation: 0,
    //   enableDrag: false,
    //   isDismissible: false,
    //   context: context,
    //   builder: (context) {
    //     return SizedBox(
    //         height: 100,
    //         width: MediaQuery.of(context).size.width,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             AnimatedButtonWidget(
    //               onPressed: () {
    //                 Navigator.of(context).pop(true);
    //               },
    //               label: 'Siguiente',
    //               color: colors[2],
    //             )
    //           ],
    //         ));
    //   },
    // );
    // _newQuestion();
    // setState(() {
    //   enabledOptions = true;
    //   hasTimedOut = false;
    // });
  }

  // _reset() {}

  // Future<void> _setBestScore() async {
  //   final prefs = await sharedPreferences();
  //   var score = prefs.getInt('bestScore') ?? 0;
  //   if (bestScoreLocal > score) {
  //     prefs.setInt('bestScore', bestScoreLocal);
  //   }
  // }

  Future<void> _getBestScore() async {
    final prefs = await sharedPreferences();
    var score = prefs.getInt('bestScore') ?? 0;
    setState(() {
      bestScoreGlobal = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // color de fondo similar
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        'ADIVINA LA BANDERA',
                        style: GoogleFonts.bubblerOne(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // azul verdoso
                        ),
                      ),
                      const Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularCountDownTimer(
                            duration: 5,
                            initialDuration: 0,
                            controller: _controller,
                            width: 50,
                            height: 50,
                            ringColor: hasTimedOut
                                ? backgroundColor
                                : Colors.white,
                            fillColor: hasTimedOut
                                ? backgroundColor
                                : Colors.grey,
                            backgroundColor: Colors.transparent,
                            strokeWidth: 5.0,
                            textStyle: GoogleFonts.bubblerOne(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textFormat: CountdownTextFormat.S,
                            isReverse: true,
                            isReverseAnimation: false,
                            isTimerTextShown: true,
                            autoStart: false,
                            onComplete: () {
                              _validateAnswer(
                                question.correctAnswer.id,
                                isTimeout: true,
                              );
                            },
                          ),
                          Visibility(
                            visible: hasTimedOut,
                            child: Container(
                              color: backgroundColor,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Tiempo Fuera',
                                  style: GoogleFonts.bubblerOne(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.favorite,
                      //       color: Colors.red[800]!,
                      //       size: 30,
                      //     ),
                      //     Text(
                      //       '$lives',
                      //       style: GoogleFonts.bubblerOne(
                      //           fontSize: 30,
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Visibility(
                        visible: question.correctAnswer.id > 0,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/flags/${question.correctAnswer.imageName}',
                              width: 300,
                              height: 250,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: question.options.map((flag) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            badges.Badge(
                              position: badges.BadgePosition.topEnd(
                                top: -5,
                                end: -5,
                              ),
                              badgeAnimation:
                                  const badges.BadgeAnimation.rotation(),
                              showBadge: flag.showBadge,
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.square,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                badgeColor: flag.isCorrect
                                    ? Colors.green[800]!
                                    : Colors.red[800]!,
                              ),
                              badgeContent: flag.showBadge
                                  ? Icon(
                                      flag.isCorrect
                                          ? Icons.check
                                          : Icons.close,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  : null,
                              child: AnimatedButtonWidget(
                                onPressed: () => hasTimedOut || !enabledOptions
                                    ? null
                                    : _validateAnswer(
                                        flag.id,
                                        showCorrectAnswer: true,
                                      ),
                                color: colors[6],
                                label: flag.countryName,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: showNextQuestionButton,
            child: Positioned(
              bottom: 30,
              child: SizedBox(
                // height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedButtonWidget(
                      onPressed: () {
                        _newQuestion();
                        setState(() {
                          enabledOptions = true;
                          hasTimedOut = false;
                          showNextQuestionButton = false;
                        });
                        // Navigator.of(context).pop(true);
                      },
                      label: 'Siguiente',
                      color: colors[2],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
