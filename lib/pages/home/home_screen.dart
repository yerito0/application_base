import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.nextPage,
  });

  final String nextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home Screen'),
            ElevatedButton(
              onPressed: () => context.pushNamed('details'),
              child: const Text('GoTo'),
            )
          ],
        ),
      ),
    );
  }
}
