part of '../view.dart';

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_UpiPinVisibilityBloc, bool>(builder: (context, showPin) {
      return TextButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
        ),
        onPressed: () {
          context.read<_UpiPinVisibilityBloc>().add(_TogglePinVisibilityEvent());
        },
        child: Row(
          children: [
            FaIcon(
              showPin ? Icons.visibility_rounded : Icons.visibility_off_rounded,
              size: 28,
              color: Color(0xFF1c3587),
            ),
            const SizedBox(width: 8),
            const Text(
              'SHOW',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1c3587),
              ),
            ),
          ],
        ),
      );
    });
  }
}
