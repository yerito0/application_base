import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'controller/dashboard_screen_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardScreenController>(
          create: (_) => DashboardScreenController(),
        ),
      ],
      builder: (context, __) => BuildDashboardScreen(
        controller: context.watch(),
        navigationShell: navigationShell,
      ),
    );
  }
}

class BuildDashboardScreen extends StatelessWidget {
  const BuildDashboardScreen({
    Key? key,
    required this.controller,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  final DashboardScreenController controller;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Config',
            icon: Icon(Icons.settings),
          )
        ],
        selectedIndex: controller.index,
        onDestinationSelected: (i) => controller.goBranch(i, navigationShell),
      ),
    );
  }
}
