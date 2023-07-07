part of 'view.dart';

abstract class AmountPageEvent extends CurieEvent {}

class _AmountBloc extends Bloc<AmountPageEvent, int> {
  BuildContext context;

  // State variables
  final _amountController = TextEditingController();

  _AmountBloc(this.context) : super(0) {
    on<AmountPageEvent>((event, emit) => emit(state + 1));
  }

  void onProceedPayment() {
    final amount = int.tryParse(_amountController.text);

    if (amount == null) return;

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => UPIConfirmationPage(amount: amount)));
  }
}
