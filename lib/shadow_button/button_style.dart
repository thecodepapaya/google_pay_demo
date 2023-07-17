import 'package:curie/shadow_button/shadow_style.dart';
import 'package:flutter/material.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton({super.key});

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> with TickerProviderStateMixin {
  double shadowOffset = 8;
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );

    final tween = Tween<double>(begin: 8, end: 0);
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = tween.animate(curvedAnimation);

    animation.addListener(() {
      if (animation.isCompleted) {
        _animateRelease();
      }

      setState(() {
        shadowOffset = animation.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  void _animatePress() {
    animationController.forward();
  }

  void _animateRelease() {
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: shadowOffset,
        right: shadowOffset,
      ),
      child: ShadowStyle(
        borderRadius: 12,
        offset: Offset(shadowOffset, shadowOffset),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            side: const MaterialStatePropertyAll(
              BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            fixedSize: const MaterialStatePropertyAll<Size>(
              Size(100, 54),
            ),
          ),
          onPressed: _animatePress,
          child: const Text('Hello'),
        ),
      ),
    );
  }
}
