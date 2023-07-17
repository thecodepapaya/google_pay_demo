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
      duration: const Duration(milliseconds: 50),
    );

    final tween = Tween<double>(begin: 8, end: 0);
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = tween.animate(curvedAnimation);

    animation.addListener(() {
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _animatePress,
      onTapDown: (_) => _animatePress(),
      onTapUp: (_) => _animateRelease(),
      onTapCancel: _animateRelease,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: shadowOffset,
          right: shadowOffset,
        ),
        child: ShadowStyle(
          borderRadius: 12,
          offset: Offset(shadowOffset, shadowOffset),
          child: ElevatedButton(
            style: ButtonStyle(
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
            onPressed: () {},
            child: const Text('Hello'),
          ),
        ),
      ),
    );
  }
}
