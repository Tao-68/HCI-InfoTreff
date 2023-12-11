import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/routing/app_router.dart';
import 'src/utils/localization.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.loc.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF734217),
          brightness: Brightness.light,
          primary: Color(0xFF734217),
          onPrimary: Color(0xFFFFF2E3),
          primaryContainer: Color(0xFFFFF2E3),
          onPrimaryContainer: Color(0xFF401E11),
          secondary: Color(0xFF734217),
          onSecondary: Color(0xFFFFF2E3),
          secondaryContainer: Color(0xFF734217),
          onSecondaryContainer: Color(0xFFFFF2E3),
          tertiary: Color(0xFFC19B7A),
          onTertiary: Color(0xFF401E11),
          tertiaryContainer: Color(0xFFC19B7A),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // use to find missing semantics
      // showSemanticsDebugger: true,
    );
  }
}
