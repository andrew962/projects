import 'package:core/l10n/app_localizations.dart';
import 'package:flag_game/dependecies.dart';
// import 'package:flag_game/pages/pages.dart';
import 'package:flag_game/providers/providers.dart';
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
    final locale = ref.watch(settingsProvider.select((s) => s.locale));
    return MaterialApp.router(
      title: 'Flag Game',
      routerConfig: appRouter,
      restorationScopeId: 'app',
      locale: Locale(locale),
      builder: (context, route) => Scaffold(body: SafeArea(child: route!)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
