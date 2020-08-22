import 'package:bloc/bloc.dart';
import 'package:cashMeOutside/bloc/payment/payment_events.dart';
import 'package:cashMeOutside/bloc/payment/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(double amountDue) : super(PaymentState(initAmountDue: amountDue));

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is ProcessPayment) {
      yield* _mapProcessPaymentToState(event);
    }
  }

  Stream<PaymentState> _mapProcessPaymentToState(
      ProcessPayment payment) async* {
    state.paymentMade = payment.amount;
    yield state;
  }

  @override
  void onChange(Change<PaymentState> change) {
    // print("there has been a change");
    // print("current: ${change.currentState.paymentMade}");
    // print("next: ${change.nextState.paymentMade}");
    super.onChange(change);
  }
}
