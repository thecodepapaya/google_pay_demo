part of '../view.dart';

class _InfoBox extends StatelessWidget {
  final int amountPaid;

  const _InfoBox({
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '₹ $amountPaid paid',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Max Life Pharma',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'ybl67898@oksbi',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 100),
        MaterialButton(
          height: 40,
          minWidth: 90,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const AmountPage()),
              (route) => false,
            );
          },
          color: const Color(0xFF375ba0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
