part of '../view.dart';

class _AmountFormField extends StatelessWidget {
  const _AmountFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: BlocBuilder<_AmountBloc, int>(
        builder: (context, amount) {
          return TextField(
            controller: context.read<_AmountBloc>()._amountController,
            autofocus: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: '0',
              hintStyle: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w300,
                color: Colors.white54,
              ),
              prefixText: '₹',
              prefixStyle: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
