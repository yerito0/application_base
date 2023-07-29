import 'package:application_base/go_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Cmabiar routerConfig entre
      //goRouterShell y goRouter

      //goRouterShell representa una navegacion anidada con ShellRouter
      //goRouter representa una navegacion anidada con statefulShellRouter
      //routerConfig: goRouter,
      routerConfig: goRouterShell,
    );
  }
}
