import 'package:bloc/bloc.dart';
import 'package:cashMeOutside/payment/bloc/payment_events.dart';
import 'package:cashMeOutside/payment/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(double amountDue) : super(PaymentState(initAmountDue: amountDue));

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is AddPayment) {
      yield* _mapAddPaymentToState(event);
    }
  }

  Stream<PaymentState> _mapAddPaymentToState(AddPayment payment) async* {
    state.paymentMade = payment.amount;
    yield state;
  }
}
