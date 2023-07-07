part of 'view.dart';

abstract class _UPIPinPageEvent extends CurieEvent {}

class _EnterDigitEvent extends _UPIPinPageEvent {
  String pinDigit;

  _EnterDigitEvent(this.pinDigit);
}

class _DeletePinEvent extends _UPIPinPageEvent {}

class _UpiPinBloc extends Bloc<_UPIPinPageEvent, String> {
  final BuildContext context;
  final int maxPinLength;
  final int amount;

  _UpiPinBloc({
    required this.context,
    required this.maxPinLength,
    required this.amount,
  }) : super('') {
    on<_DeletePinEvent>((event, emit) {
      final pin = state;
      final newPin = pin.substring(0, pin.length - 1);
      emit(newPin);
    });

    on<_EnterDigitEvent>((event, emit) {
      final pin = state;

      if (pin.length >= maxPinLength) return;

      final newPin = pin + event.pinDigit;

      emit(newPin);
    });
  }

  void onSubmitPinPressed() {
    if (maxPinLength == state.length) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ConfirmationPage(
            amountPaid: amount,
          ),
        ),
      );
    }
  }
}

abstract class _UPIPinVisibilityEvent extends CurieEvent {}

class _TogglePinVisibilityEvent extends _UPIPinVisibilityEvent {}

class _UpiPinVisibilityBloc extends Bloc<_UPIPinVisibilityEvent, bool> {
  BuildContext context;

  _UpiPinVisibilityBloc(this.context) : super(false) {
    on<_TogglePinVisibilityEvent>((event, emit) => emit(!state));
  }
}
