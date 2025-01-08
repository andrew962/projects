import 'package:flag_game/dependecies.dart';
// import 'package:flag_game/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const config = String.fromEnvironment('config');
  String fileName = '.env';
  if (config.isNotEmpty) {
    fileName = '$fileName.$config';
  }
  await dotenv.load(fileName: 'env/$fileName');

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
      restorationScopeId: 'app',
      builder: (context, route) => Scaffold(
        body: route,
      ),
    );
  }
}
