import 'package:bloc/bloc.dart';

import './payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(double initialAmount)
      : super(PaymentState(initAmountDue: initialAmount));

  processPayment(double amount) {
    // state.paymentMade = amount;
    // CashBreakdown cashBreakdown = new CashBreakdown(amount);
    // cashBreakdown.processBreakdown();
    // if (cashBreakdown.returnAmount != 0.0) {
    //   emit(state);
    //   return cashBreakdown.returnAmount;
    // } else {
    //   state.cashBreakdown = cashBreakdown;
    //   emit(state);
    //   return null;
    // }
    emit(state);
    return amount;
  }
}
