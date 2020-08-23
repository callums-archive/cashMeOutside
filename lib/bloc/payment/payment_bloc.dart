import 'package:bloc/bloc.dart';
import "./payment_state.dart";
import "./payment_events.dart";

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(double amountDue) : super(PaymentState(initAmountDue: amountDue));

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is ProcessPayment) {
      yield* _mapProcessPaymentToState(event);
    }
  }

  Stream<PaymentState> _mapProcessPaymentToState(
      ProcessPayment payment) async* {
    yield state;
  }

  @override
  void onEvent(Object event) {
    print('$event');
    super.onEvent(event);
  }

  // @override
  // void onTransition(Transition<PaymentEvent, PaymentState> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }

  // @override
  // void onChange(Change<PaymentState> change) {
  //   print("there has been a change");
  //   print("current: ${change.currentState.paymentMade}");
  //   print("next: ${change.nextState.paymentMade}");
  //   super.onChange(change);
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('$error $stackTrace');
  //   super.onError(error, stackTrace);
  // }
}
