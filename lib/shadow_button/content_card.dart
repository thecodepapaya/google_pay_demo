import 'package:curie/shadow_button/shadow_style.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowStyle(
      child: SizedBox(
        height: 200,
        width: 320,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
