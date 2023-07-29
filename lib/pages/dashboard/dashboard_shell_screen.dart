import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'controller/dashboard_screen_controller.dart';

class DashboardShellScreen extends StatelessWidget {
  const DashboardShellScreen({
    super.key,
    required this.shellChild,
  });

  final Widget shellChild;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardScreenController>(
          create: (_) => DashboardScreenController(),
        ),
      ],
      builder: (context, __) => BuildDashboardShellScreen(
        controller: context.watch(),
        shellChild: shellChild,
      ),
    );
  }
}

class BuildDashboardShellScreen extends StatelessWidget {
  const BuildDashboardShellScreen({
    Key? key,
    required this.controller,
    required this.shellChild,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  final DashboardScreenController controller;
  final Widget shellChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shellChild,
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
        onDestinationSelected: (i) {
          context.go(controller.rotues[i]);
          controller.goBranchShell(i);
        },
      ),
    );
  }
}
