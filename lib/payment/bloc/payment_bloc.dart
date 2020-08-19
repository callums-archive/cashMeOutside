import 'package:bloc/bloc.dart';
import 'package:cashMeOutside/payment/bloc/paymentEvents.dart';
import 'package:cashMeOutside/payment/bloc/paymentState.dart';

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

// Future<void> main() async {
//   PaymentBloc pb = PaymentBloc(44.99);

//   print(pb.state.paymentMade);

//   pb.add(AddPayment(amount: 33.33));

//   print(pb.state.paymentMade);

//   pb.close();
// }
