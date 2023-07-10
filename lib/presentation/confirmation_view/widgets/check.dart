part of '../view.dart';

class _SuccessCheckMark extends StatelessWidget {
  const _SuccessCheckMark();

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/checkmark.json',
      repeat: false,
      height: 200,
    );
  }
}
