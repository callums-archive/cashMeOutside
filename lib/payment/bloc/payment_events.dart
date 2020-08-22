import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class AddPayment extends PaymentEvent {
  final double amount;
  const AddPayment({@required this.amount});
}

class ProcessPayment extends PaymentEvent {}
