import 'package:flutter/material.dart';

import 'dash_card.dart';

class ShadowButtonPage extends StatefulWidget {
  const ShadowButtonPage({super.key});

  @override
  State<ShadowButtonPage> createState() => _ShadowButtonPageState();
}

class _ShadowButtonPageState extends State<ShadowButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shadow button demo'),
      ),
      body: const Center(
        child: DashCard(),
      ),
    );
  }
}
