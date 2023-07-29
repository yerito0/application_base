import 'package:application_base/pages/config/config_screen.dart';
import 'package:application_base/pages/dashboard/dashboard_screen.dart';
import 'package:application_base/pages/dashboard/dashboard_shell_screen.dart';
import 'package:application_base/pages/home/home_screen.dart';
import 'package:application_base/pages/shared/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/a',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return DashboardScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(nextPage: '/a/details'),
              ),
              routes: [
                // child route
                GoRoute(
                  name: 'details',
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'A'),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ConfigScreen(nextPage: '/b/details'),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'B'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

final goRouterShell = GoRouter(
  initialLocation: '/a',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, navigationShell) {
        // the UI shell
        return DashboardShellScreen(
          shellChild: navigationShell,
        );
      },
      routes: [
        // first branch (A)
        // top route inside branch
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/a',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(nextPage: '/a/details'),
          ),
          routes: [
            // child route
            GoRoute(
              name: 'details',
              path: 'details',
              builder: (context, state) => const DetailsScreen(label: 'A'),
            ),
          ],
        ),
        // second branch (B)

        // top route inside branch
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/b',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ConfigScreen(nextPage: '/b/details'),
          ),
          routes: [
            // child route
            GoRoute(
              path: 'details',
              builder: (context, state) => const DetailsScreen(label: 'B'),
            ),
          ],
        ),
      ],
    ),
  ],
);
