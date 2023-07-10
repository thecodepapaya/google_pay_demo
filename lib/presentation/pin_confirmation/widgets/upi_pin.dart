part of '../view.dart';

class _UpiPin extends StatelessWidget {
  final int pinLength;

  const _UpiPin({required this.pinLength});

  @override
  Widget build(BuildContext context) {
    const outerPadding = 50.0;

    return BlocBuilder<_UpiPinVisibilityBloc, bool>(
      builder: (context, showPin) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: outerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(
                      'ENTER UPI PIN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF646464),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    _VisibilityToggle(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<_UpiPinBloc, String>(
                builder: (context, pin) {
                  return _Pin(
                    maxPinLength: pinLength,
                    showPin: showPin,
                    pin: pin,
                  );
                },
              ),
              const SizedBox(height: 8),
              _Dashes(pinLength: pinLength),
            ],
          ),
        );
      },
    );
  }
}

class _Pin extends StatelessWidget {
  final String pin;
  final int maxPinLength;
  final bool showPin;

  const _Pin({
    required this.pin,
    required this.maxPinLength,
    required this.showPin,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    final paddingCount = maxPinLength - pin.length;

    String paddedPin = pin;

    for (int i = 0; i < paddingCount; i++) {
      paddedPin += ' ';
    }

    paddedPin.split('').forEach((String num) {
      final hideDot = showPin || num == ' ';

      widgets.add(
        SizedBox(
          width: 26,
          child: Text(
            hideDot ? num : '•',
            style: TextStyle(
              fontSize: showPin ? 36 : 52,
            ),
          ),
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
        ),
      ),
    );
  }
}

class _Dashes extends StatelessWidget {
  final int pinLength;

  const _Dashes({
    required this.pinLength,
  });

  @override
  Widget build(BuildContext context) {
    final dashRow = <Widget>[_dash];

    for (int i = 1; i < pinLength; i++) {
      dashRow.add(_space);
      dashRow.add(_dash);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dashRow,
    );
  }

  Widget get _space {
    return const SizedBox(width: 10);
  }

  Widget get _dash {
    return Container(
      height: 3,
      width: 45,
      color: const Color(0xFFc7c7c7),
    );
  }
}
