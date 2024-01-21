import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/routing/app_router.dart';
import 'src/utils/localization.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    //Colors

    const primaryLight = Color(0xFFFFF2E3);
    const primaryDark = Color(0xFF401E11);

    const secondaryLight = Color(0xFFC19B7A);
    const secondaryDark = Color(0xFF734217);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.loc.appTitle,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        textTheme: GoogleFonts.averiaSerifLibreTextTheme(),
        colorScheme: const ColorScheme.light(
          primary: primaryLight,
          onPrimary: primaryDark,
          secondary: secondaryLight,
          onSecondary: secondaryDark,
        ),
      ),
      // use to find missing semantics
      // showSemanticsDebugger: true,
    );
  }
}
