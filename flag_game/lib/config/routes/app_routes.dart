import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';

final parentKey = GlobalKey<NavigatorState>(debugLabel: "root");
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: parentKey,
    initialLocation: '/',
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'new-game',
            builder: (context, state) => const NewGamePage(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return SettingsPage(
                isGameInProgress: extra?['gameInProgress'] == true,
              );
            },
          ),
          GoRoute(
            path: 'results',
            redirect: (context, state) {
              final extra = state.extra;
              if (extra == null || extra is! Map<String, dynamic>) return '/';
              return null;
            },
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return ResultsPage(
                score: data['score'] as int? ?? 0,
                bestScore: data['bestScore'] as int? ?? 0,
                isNewRecord: data['isNewRecord'] as bool? ?? false,
                correctAnswers: data['correctAnswers'] as int? ?? 0,
                totalQuestions: data['totalQuestions'] as int? ?? 0,
                maxStreak: data['maxStreak'] as int? ?? 0,
                livesRemaining: data['livesRemaining'] as int? ?? 0,
                totalLives: data['totalLives'] as int? ?? 1,
              );
            },
          ),
        ],
      ),
    ],
  );
});
