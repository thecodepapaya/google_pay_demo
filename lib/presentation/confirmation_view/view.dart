import 'dart:async';

import 'package:curie/presentation/amount/view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';

part 'controller.dart';
part 'widgets/check.dart';
part 'widgets/info_box.dart';
part 'widgets/payment_progress.dart';

class ConfirmationPage extends StatefulWidget {
  final int amountPaid;

  const ConfirmationPage({
    super.key,
    required this.amountPaid,
  });

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Widget _lottieWidget = const _PaymentProgress();

  double lottieBottomPosition = 350;
  int animationStartDuration = 5000;
  int slideDuration = 350;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3000), _paymentSuccess);
    Timer(Duration(milliseconds: animationStartDuration), _animatePosition);
  }

  void _paymentSuccess() {
    setState(() {
      _lottieWidget = const _SuccessCheckMark();
    });
  }

  void _animatePosition() {
    setState(() {
      lottieBottomPosition = 270;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5086ec),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: slideDuration),
            curve: Curves.easeIn,
            left: 0,
            right: 0,
            top: lottieBottomPosition,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _lottieWidget,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ),
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: ShowUpAnimation(
              animationDuration: Duration(milliseconds: slideDuration),
              delayStart: Duration(milliseconds: animationStartDuration),
              child: _InfoBox(amountPaid: widget.amountPaid),
            ),
          ),
        ],
      ),
    );
  }
}
