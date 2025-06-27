import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';

final parentKey = GlobalKey<NavigatorState>(debugLabel: "root");
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: parentKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
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
            builder: (context, state) => const SettingsPage(),
          )
        ],
      ),
    ],
  );
});
