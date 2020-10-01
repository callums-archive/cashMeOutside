import 'package:bloc/bloc.dart';

import './payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(double initialAmount)
      : super(PaymentState(initAmountDue: initialAmount));

  processPayment(double amount) {
    emit(state);
    print(state.paymentMade);
    return amount;
  }
}
