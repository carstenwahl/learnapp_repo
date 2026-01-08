import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => 'Element${index + 1}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Selection'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
