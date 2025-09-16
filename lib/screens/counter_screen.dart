import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/counter_text.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to theme changes at screen level (ok to rebuild the screen)
    final theme = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter'),
        actions: [
          Row(
            children: [
              const Icon(Icons.dark_mode),
              Switch(
                value: theme.isDark,
                onChanged: (_) => context.read<ThemeProvider>().toggle(),
              ),
            ],
          ),
        ],
      ),
      body: const Center(child: CounterText()),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: 'dec',
              onPressed: () => context.read<CounterProvider>().decrement(),
              label: const Text('-'),
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              heroTag: 'inc',
              onPressed: () => context.read<CounterProvider>().increment(),
              label: const Text('+'),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              heroTag: 'reset',
              onPressed: () => context.read<CounterProvider>().reset(),
              label: const Text('Reset'),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
