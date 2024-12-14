// import 'package:flag_game/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../config/routes/route.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int bestScore = 0;
  @override
  void initState() {
    super.initState();
    getBestScore();
  }

  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> getBestScore() async {
    final prefs = await sharedPreferences();
    var score = prefs.getInt("bestScore") ?? 0;
    setState(() {
      bestScore = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Mejor puntaje: $bestScore',
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 40,
        color: Color(0xFF666870),
        height: 0.9,
        letterSpacing: -2,
      ),
    );

    // add a rainbow gradient:
    // I'm lazy so I'll just apply a ShimmerEffect, use a ValueAdapter to
    // pause it half way, and let it handle the details
    // title = title.animate(adapter: ValueAdapter(0.5)).shimmer(
    //   colors: [
    //     // const Color(0xFFFFFF00),
    //     const Color(0xFF00FF00),
    //     const Color(0xFF00FFFF),
    //     const Color(0xFF0033FF),
    //     const Color(0xFFFF00FF),
    //     const Color(0xFFFF0000),
    //     // const Color(0xFFFFFF00),
    //   ],
    // );

    // sequence some visual effects
    title = title
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .saturate(delay: 500.milliseconds, duration: 500.milliseconds)
        .then() // set baseline time to previous effect's end time
        // .tint(color: const Color(0xFF80DDFF))
        .then()
        .blurXY(end: 1)
        .fadeOut();

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title,
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey[300])),
              onPressed: () {
                context.replace('/new-game');
              },
              child: const Text(
                "Juego Nuevo",
                style: TextStyle(color: Colors.black),
              )),
        ),
      ],
    ));
  }
}
