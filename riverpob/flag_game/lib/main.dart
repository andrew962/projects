import 'package:flag_game/dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'env/.env');

  dependecies();

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Flag Game',
      routerConfig: appRouter,
      builder: (context, route) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: const Center(child: Text("Flag Game"))),
        body: route,
      ),
      // home: Scaffold(body: SafeArea(child: HomePage())),
    );
  }
}
