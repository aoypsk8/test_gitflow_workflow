import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuild only when the `count` value changes
    return Selector<CounterProvider, int>(
      selector: (_, p) => p.count,
      builder: (_, count, __) {
        return Text(
          'Developer: $count',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        );
      },
    );
  }
}


// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// register page
