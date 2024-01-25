import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/pop_ups/presentation/favorites_popup.dart';
import 'package:ri_go_demo/src/pop_ups/presentation/feedback_popup.dart';
import 'package:ri_go_demo/src/pop_ups/presentation/settings_popup.dart';

//import '../constants/breakpoint.dart';
//import '../utils/localization.dart';

// see https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
// and https://github.com/bizz84/tmdb_movie_app_riverpod/blob/main/lib/src/routing/scaffold_with_nested_navigation.dart
class NavigationItem {
  NavigationItem({required this.icon, required this.selectedIcon});
  final IconData icon;
  final IconData selectedIcon;
}

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.sizeOf(context);
    return ScaffoldWithAppBar(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithAppBar extends ConsumerWidget {
  const ScaffoldWithAppBar({
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: body,
      appBar: AppBar(
        title: Text(
          'InfoTreff',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        shadowColor: theme.colorScheme.onSecondary,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => const Dialog(
                child: SettingsPopUp(),
              ),
            ),
            icon: const Icon(Icons.settings_outlined),
            color: theme.colorScheme.onPrimary,
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => const Dialog(
                child: FeedbackPopup(),
              ),
            ),
            icon: const Icon(
              Icons.comment_outlined,
            ),
            color: theme.colorScheme.onPrimary,
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => const Dialog(
                child: FavoritesPopup(),
              ),
            ),
            icon: const Icon(Icons.star_outline_rounded),
            iconSize: 30,
            color: theme.colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
