import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/breakpoint.dart';
import '../utils/localization.dart';

// see https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
// and https://github.com/bizz84/tmdb_movie_app_riverpod/blob/main/lib/src/routing/scaffold_with_nested_navigation.dart
class NavigationItem {
  NavigationItem({required this.icon, required this.selectedIcon});
  final IconData icon;
  final IconData selectedIcon;
}

final _navigationList = (
  people: NavigationItem(icon: Icons.home_outlined, selectedIcon: Icons.home),
  counter: NavigationItem(
    icon: Icons.plus_one_outlined,
    selectedIcon: Icons.plus_one,
  ),
);

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
    final size = MediaQuery.sizeOf(context);
    return ScaffoldWithAppBar(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithAppBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: body,
      appBar: AppBar(
        title: Text(
          'InfoTreff',
          style: TextStyle(
              color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.colorScheme.primary,
        shadowColor: theme.colorScheme.onSecondary,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: open Settings PopUp
            },
            icon: Icon(Icons.settings_outlined),
            color: theme.colorScheme.onPrimary,
          ),
          IconButton(
              onPressed: () {
                //TODO: open feedback PopUp
              },
              icon: Icon(
                Icons.comment_outlined,
              ),
              color: theme.colorScheme.onPrimary),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
              color: theme.colorScheme.onPrimary),
        ],
      ),
    );
  }
}
