part of '../view.dart';

class _SuccessCheckMark extends StatelessWidget {
  const _SuccessCheckMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/checkmark.json',
      repeat: false,
      height: 200,
    );
  }
}
