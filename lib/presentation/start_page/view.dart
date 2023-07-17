import 'package:curie/presentation/amount/view.dart';
import 'package:curie/shadow_button/homepage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AmountPage()));
              },
              child: const Text('Start GPay Demo'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ShadowButtonPage()));
              },
              child: const Text('Start Shadow Button Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
