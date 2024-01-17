import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/features/events/presentation/events_screen.dart';
import 'package:ri_go_demo/src/features/menu/presentation/menu_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/counter/presentation/counter_screen.dart';
import '../features/rest_crud_demo/domain/person.dart';
import '../features/rest_crud_demo/presentation/details_screen.dart';
import '../features/rest_crud_demo/presentation/people_screen.dart';
import 'scaffold_with_navigation.dart';

part 'app_router.g.dart';

// general ideas on navigation see https://m2.material.io/design/navigation/understanding-navigation.html#forward-navigation

// shell routes, appear in the bottom navigation
// see https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
enum TopLevelDestinations { menu, events }

// GlobalKey is a factory, hence each call creates a key
//this is root, even if it navigates to people, it needs a separate key!!!
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _eventsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.events.name);
final _menuNavigatorKey = GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.menu.name);

// other destinations, reachable from a top level destination
enum SubRoutes { details }

enum Parameter { id }

//https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/${TopLevelDestinations.events.name}',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _eventsNavigatorKey,
            routes: [
              GoRoute(
                path: '/${TopLevelDestinations.events.name}', // path: /event
                name: TopLevelDestinations.events.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const EventsScreen(),
                ),
              ),
            ],
          ),          
          StatefulShellBranch(
            navigatorKey: _menuNavigatorKey,
            routes: [
              GoRoute(
                path: '/${TopLevelDestinations.menu.name}', // path: /menu
                name: TopLevelDestinations.menu.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MenuScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}


