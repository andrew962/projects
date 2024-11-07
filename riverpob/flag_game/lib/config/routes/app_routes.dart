import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
      GoRoute(
        path: '/new-game',
        builder: (context, state) => const NewGamePage(),
      )
    ]),
  ]);
});
