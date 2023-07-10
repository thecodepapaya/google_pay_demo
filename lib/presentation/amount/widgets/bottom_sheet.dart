part of '../view.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_AmountBloc, int>(
      builder: (context, amount) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(20),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.moneyBill,
                    size: 26,
                    color: Color(0xFF9e9e9e),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Axis Bank **** 4321',
                    style: TextStyle(
                      color: Color(0xFF494949),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF3b3b3b),
                    size: 34,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                onPressed: context.read<_AmountBloc>().onProceedPayment,
                color: const Color(0xFF1b72e8),
                height: 48,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Proceed to pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Color(0xFFb8b8b8),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'IN PARTNERSHIP WITH ',
                    ),
                    WidgetSpan(
                      child: FaIcon(
                        FontAwesomeIcons.buildingColumns,
                        color: Color(0xFFb8b8b8),
                        size: 13,
                      ),
                    ),
                    TextSpan(
                      text: ' YOUR BANK',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        );
      },
    );
  }
}
