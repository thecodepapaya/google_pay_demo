import 'package:curie/shadow_button/content_card.dart';
import 'package:flutter/material.dart';

import 'button_style.dart';

class DashCard extends StatelessWidget {
  const DashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        ContentCard(),
        Positioned(
          right: 35,
          bottom: 4,
          child: ShadowButton(),
        ),
        Positioned(
          bottom: 4,
          right: 170,
          child: ShadowButton(),
        ),
      ],
    );
  }
}
