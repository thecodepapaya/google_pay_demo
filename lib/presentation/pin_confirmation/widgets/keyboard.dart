part of '../view.dart';

class _Keyboard extends StatelessWidget {
  const _Keyboard();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf1f1f1),
      padding: const EdgeInsets.only(bottom: 20),
      child: GridView.count(
        childAspectRatio: 1.8,
        shrinkWrap: true,
        crossAxisCount: 3,
        children: const [
          _KeyboardNumber(number: '1'),
          _KeyboardNumber(number: '2'),
          _KeyboardNumber(number: '3'),
          _KeyboardNumber(number: '4'),
          _KeyboardNumber(number: '5'),
          _KeyboardNumber(number: '6'),
          _KeyboardNumber(number: '7'),
          _KeyboardNumber(number: '8'),
          _KeyboardNumber(number: '9'),
          _KeyboardBackspace(),
          _KeyboardNumber(number: '0'),
          _KeyboardProceed(),
        ],
      ),
    );
  }
}

class _KeyboardNumber extends StatelessWidget {
  final String number;

  const _KeyboardNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_UpiPinBloc, String>(
      builder: (context, pin) {
        return Center(
          child: TextButton(
            onPressed: () {
              context.read<_UpiPinBloc>().add(_EnterDigitEvent(number));
            },
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFF1b3182),
                fontSize: 44,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _KeyboardBackspace extends StatelessWidget {
  const _KeyboardBackspace();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_UpiPinBloc, String>(builder: (context, pin) {
      return TextButton(
        onPressed: () {
          context.read<_UpiPinBloc>().add(_DeletePinEvent());
        },
        child: const Center(
          child: Icon(
            Icons.backspace,
            size: 36,
            color: Color(0xFF1b3182),
          ),
        ),
      );
    });
  }
}

class _KeyboardProceed extends StatelessWidget {
  const _KeyboardProceed();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_UpiPinBloc, String>(
      builder: (context, pin) {
        return TextButton(
          onPressed: context.read<_UpiPinBloc>().onSubmitPinPressed,
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF1b3182),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 65,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
