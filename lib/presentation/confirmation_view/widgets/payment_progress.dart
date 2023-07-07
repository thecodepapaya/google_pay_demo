part of '../view.dart';

class _PaymentProgress extends StatelessWidget {
  const _PaymentProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/payment_progress.json',
            repeat: true,
            height: 150,
          ),
          const SizedBox(height: 50),
          const Text(
            'Processing...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
