import 'package:flutter/material.dart';
import 'selection_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('LearnApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectionScreen()),
                );
              },
              child: const Text('Nächster Screen'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Test button - does nothing
              },
              child: const Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
