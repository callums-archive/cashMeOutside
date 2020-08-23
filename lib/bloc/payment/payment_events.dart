import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class ProcessPayment extends PaymentEvent {
  final double amount;
  const ProcessPayment({@required this.amount});
}
