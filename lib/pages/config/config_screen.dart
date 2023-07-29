import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({
    super.key,
    required this.nextPage,
  });

  final String nextPage;

  @override
  Widget build(BuildContext context) {
    print('config');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Config'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Config Screen'),
            ElevatedButton(
              onPressed: () => context.go(nextPage),
              child: const Text('GoTo'),
            )
          ],
        ),
      ),
    );
  }
}
