import 'package:cashMeOutside/cubit/payment/payment_cubit.dart';

void main() {
  PaymentCubit paymentCubit = new PaymentCubit(66.00);
  paymentCubit.processPayment(80.80);
}
