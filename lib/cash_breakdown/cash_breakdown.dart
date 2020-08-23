import 'package:cashMeOutside/cash_breakdown/cash_values.dart';

class CashBreakdown {
  double returnAmount;
  Map<cashType, int> tally = {
    cashType.R200: 0,
    cashType.R100: 0,
    cashType.R50: 0,
    cashType.R20: 0,
    cashType.R10: 0,
    cashType.R5: 0,
    cashType.R2: 0,
    cashType.R1: 0,
    cashType.c50: 0,
    cashType.c20: 0
  };

  CashBreakdown(double amount) {
    returnAmount = amount;
  }

  void processBreakdown() {
    legalTender.forEach((cashTypeKey, cashValue) {
      while (returnAmount >= cashValue) {
        returnAmount = returnAmount -= cashValue;
        tally[cashTypeKey]++;
      }
    });
  }
}
