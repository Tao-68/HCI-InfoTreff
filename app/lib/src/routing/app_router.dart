import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/features/events/presentation/events_screen.dart';
import 'package:ri_go_demo/src/features/home/presentation/home_screen.dart';
import 'package:ri_go_demo/src/features/menu/presentation/menu_screen.dart';
import 'package:ri_go_demo/src/pop_ups/presentation/filter_popup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scaffold_with_navigation.dart';

part 'app_router.g.dart';

// general ideas on navigation see https://m2.material.io/design/navigation/understanding-navigation.html#forward-navigation

// shell routes, appear in the bottom navigation
// see https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
enum TopLevelDestinations {
  menu,
  home,
  events,
}

// GlobalKey is a factory, hence each call creates a key
//this is root, even if it navigates to people, it needs a separate key!!!
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _eventsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.events.name);
final _menuNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.menu.name);
final _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.home.name);

// other destinations, reachable from a top level destination
enum SubRoutes {
  details,
  filter,
  favorits,
  settings,
  feedback,
  menuDetails,
  eventDetails
}

enum Parameter { id }

//https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/${TopLevelDestinations.home.name}',
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
            navigatorKey: _homeNavigatorKey,
            routes: [
              // base route home
              GoRoute(
                path: '/${TopLevelDestinations.home.name}', // path: /home
                name: TopLevelDestinations.home.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _menuNavigatorKey,
            routes: [
              GoRoute(
                path: '/${TopLevelDestinations.menu.name}', //path: /menu
                name: TopLevelDestinations.menu.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MenuPage(),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: SubRoutes.filter.name, //path: /menu/filter ?
                    name: SubRoutes.filter.name,
                    builder: (BuildContext context, GoRouterState state) {
                      // alternatively use https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html

                      return const FilterPopUp();
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _eventsNavigatorKey,
            routes: [
              GoRoute(
                path: '/${TopLevelDestinations.events.name}', // path: /event
                name: TopLevelDestinations.events.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child:
                      const EventsScreen(), //const MyPageView(initialPageIndex: 2),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
