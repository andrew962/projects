import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:data/data.dart';
import 'package:flag_game/widgets/animated_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/providers.dart';
import '../services/services.dart';

class NewGamePage extends StatefulHookConsumerWidget {
  const NewGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGamePageState();
}

class _NewGamePageState extends ConsumerState<NewGamePage> {
  GameService gameService = GameService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool showNextQuestionButton = false;
  int bestScoreGlobal = 0;
  int currentScore = 0;
  bool isNewRecord = false;
  int lives = 5;
  int questionNumber = 0;
  bool enabledOptions = true;
  bool isGameOver = false;
  QuestionModel question = QuestionModel(correctAnswer: FlagItemModel());
  final CountDownController _controller = CountDownController();
  final backgroundColor = const Color(0xFF5DA6A7);
  bool hasTimedOut = false;
  int currentStreak = 0;
  int _livesLostCount = 0;
  int _correctAnswers = 0;
  int _maxStreak = 0;
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
    gameService.resetGame();
    _setupGame();
    _newQuestion();
    _getBestScore();
  }

  void _setupGame() {
    setState(() {
      lives = ref.read(settingsProvider).livesCount;
      currentScore = 0;
      questionNumber = 0;
      isNewRecord = false;
      isGameOver = false;
      showNextQuestionButton = false;
      enabledOptions = true;
      hasTimedOut = false;
      currentStreak = 0;
      _livesLostCount = 0;
      _correctAnswers = 0;
      _maxStreak = 0;
    });
  }

  void _newQuestion() async {
    final timerDuration = ref.read(settingsProvider).timerDuration;
    QuestionModel newQuestion = await gameService.newQuestion();
    if (!mounted) return;
    setState(() {
      question = newQuestion;
      questionNumber++;
      enabledOptions = true;
      hasTimedOut = false;
    });
    _controller.restart(duration: timerDuration);
  }

  void _validateAnswer(
    int selectedID, {
    bool isTimeout = false,
    bool showCorrectAnswer = false,
  }) async {
    final bool isCorrectAnswer =
        !isTimeout && selectedID == question.correctAnswer.id;

    setState(() {
      enabledOptions = false;
      hasTimedOut = isTimeout;

      if (isCorrectAnswer) {
        currentStreak++;
        _correctAnswers++;
        if (currentStreak > _maxStreak) _maxStreak = currentStreak;
        final bonus = currentStreak >= 5 ? 2 : currentStreak >= 3 ? 1 : 0;
        currentScore += 1 + bonus;
      } else {
        currentStreak = 0;
        _livesLostCount++;
        lives--;
      }

      if (lives <= 0) {
        isGameOver = true;
      }
      showNextQuestionButton = true;

      if (!isTimeout) {
        _controller.pause();
      }

      if (!isTimeout) {
        gameService.deleteFlagID(question.correctAnswer.id);
      }

      question = question.copyWith(
        options: question.options.map((element) {
          if ((selectedID == element.id) ||
              (showCorrectAnswer && question.correctAnswer.id == element.id)) {
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

    if (isGameOver) {
      await Future.wait([_saveBestScore(), _playSound('fail.mp3')]);
    } else if (isCorrectAnswer) {
      _playSound('correct.mp3');
    } else if (isTimeout) {
      _playSound('error.mp3');
    } else {
      _playSound('wrong_answer.mp3');
    }
  }

  Future<void> _getBestScore() async {
    final prefs = await sharedPreferences();
    if (!mounted) return;
    setState(() {
      bestScoreGlobal = prefs.getInt('bestScore') ?? 0;
    });
  }

  Future<void> _saveBestScore() async {
    if (currentScore > bestScoreGlobal) {
      final prefs = await sharedPreferences();
      await prefs.setInt('bestScore', currentScore);
      if (!mounted) return;
      setState(() {
        isNewRecord = true;
        bestScoreGlobal = currentScore;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSound(String soundName) async {
    if (!ref.read(settingsProvider).soundEnabled) return;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('sounds/$soundName'));
  }

  Widget _buildLives(int totalLives) {
    final double iconSize = totalLives > 5 ? 18.0 : 24.0;
    final double hPadding = totalLives > 5 ? 1.0 : 2.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalLives, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          child: Icon(
            index < lives ? Icons.favorite : Icons.favorite_border,
            color: index < lives ? Colors.red[700] : Colors.white54,
            size: iconSize,
          ),
        );
      }),
    );
  }

  void _goToResults() {
    context.replace('/results', extra: {
      'score': currentScore,
      'bestScore': bestScoreGlobal,
      'isNewRecord': isNewRecord,
      'correctAnswers': _correctAnswers,
      'totalQuestions': questionNumber,
      'maxStreak': _maxStreak,
      'livesRemaining': lives,
      'totalLives': ref.read(settingsProvider).livesCount,
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            children: [
              // ── Header ──────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                  Text(
                    'ADIVINA LA BANDERA',
                    style: GoogleFonts.bubblerOne(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () async {
                      if (enabledOptions) _controller.pause();
                      await context.push('/settings',
                          extra: {'gameInProgress': true});
                      if (mounted && enabledOptions) _controller.resume();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // ── Vidas / Score / Timer ────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KeyedSubtree(
                    key: ValueKey(_livesLostCount),
                    child: _livesLostCount > 0
                        ? _buildLives(settings.livesCount)
                            .animate()
                            .shake(duration: 400.ms, hz: 4)
                        : _buildLives(settings.livesCount),
                  ),
                  Column(
                    children: [
                      if (settings.showQuestionCounter)
                        Text(
                          'Pregunta $questionNumber',
                          style: GoogleFonts.bubblerOne(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                          scale: CurvedAnimation(
                            parent: animation,
                            curve: Curves.elasticOut,
                          ),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                        child: Text(
                          key: ValueKey(currentScore),
                          '$currentScore',
                          style: GoogleFonts.bubblerOne(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (currentStreak >= 2)
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Row(
                            key: ValueKey(currentStreak),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: currentStreak >= 5
                                    ? Colors.orange[300]
                                    : Colors.white70,
                                size: 16,
                              ),
                              Text(
                                'x$currentStreak',
                                style: GoogleFonts.bubblerOne(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Text(
                        'Récord: $bestScoreGlobal',
                        style: GoogleFonts.bubblerOne(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularCountDownTimer(
                          duration: settings.timerDuration,
                          initialDuration: 0,
                          controller: _controller,
                          width: 50,
                          height: 50,
                          ringColor:
                              hasTimedOut ? backgroundColor : Colors.white,
                          fillColor:
                              hasTimedOut ? backgroundColor : Colors.grey,
                          backgroundColor: Colors.transparent,
                          strokeWidth: 5.0,
                          textStyle: GoogleFonts.bubblerOne(
                            fontSize: 22,
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
                        if (hasTimedOut)
                          Positioned.fill(
                            child: Container(
                              color: backgroundColor,
                              child: Center(
                                child: Text(
                                  'Tiempo\nFuera',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bubblerOne(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // ── Bandera ──────────────────────────────────────────
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ),
                        ),
                        child: child,
                      ),
                    ),
                    child: question.correctAnswer.id > 0
                        ? Image.asset(
                            key: ValueKey(question.correctAnswer.id),
                            'assets/flags/${question.correctAnswer.imageName}',
                            fit: BoxFit.contain,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // ── Opciones ─────────────────────────────────────────
              ...question.options.map((flag) {
                final Color btnColor = flag.showBadge
                    ? (flag.isCorrect ? Colors.green[400]! : Colors.red[300]!)
                    : colors[6];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedButtonWidget(
                        onPressed: () => _validateAnswer(
                          flag.id,
                          showCorrectAnswer: true,
                        ),
                        enabled: enabledOptions && !hasTimedOut,
                        color: btnColor,
                        label: flag.countryName,
                      ),
                    ],
                  ),
                );
              }),
              // ── Botón Siguiente / Ver resultados ─────────────────
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOut,
                child: showNextQuestionButton
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: (isGameOver
                                ? AnimatedButtonWidget(
                                    onPressed: _goToResults,
                                    label: 'Ver resultados',
                                    icon: const Icon(
                                      Icons.emoji_events,
                                      size: 25,
                                      color: Colors.amber,
                                    ),
                                    color: colors[3],
                                  )
                                : AnimatedButtonWidget(
                                    onPressed: () {
                                      setState(() =>
                                          showNextQuestionButton = false);
                                      _newQuestion();
                                    },
                                    label: 'Siguiente',
                                    icon: const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 25,
                                    ),
                                    color: colors[1],
                                  ))
                            .animate()
                            .slideY(
                              begin: 0.5,
                              end: 0,
                              duration: 280.ms,
                              curve: Curves.easeOut,
                            )
                            .fadeIn(duration: 220.ms),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
