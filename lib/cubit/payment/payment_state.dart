import 'package:cashMeOutside/cash_breakdown/cash_breakdown.dart';

class PaymentState {
  double amountDue;
  double paymentMade;
  CashBreakdown cashBreakdown;
  PaymentState({double initAmountDue = 0.0}) {
    amountDue = initAmountDue;
  }
}
