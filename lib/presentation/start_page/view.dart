import 'package:curie/presentation/amount/view.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AmountPage()));
          },
          child: const Text('Start Demo'),
        ),
      ),
    );
  }
}
