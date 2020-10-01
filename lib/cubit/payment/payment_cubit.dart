import 'package:bloc/bloc.dart';

import './payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(double initialAmount)
      : super(PaymentState(initAmountDue: initialAmount));

  double processPayment(double amount) {
    print(state.due);
    print(state.payment);
    return state.payment;
  }

  void addPayment(double payment) {
    state.payment = payment;
    emit(state);
  }
}
