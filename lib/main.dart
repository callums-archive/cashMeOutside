import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'views/payment/payment_screen.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print(
        "there are changes ${cubit.runtimeType} => ${change.currentState.paymentMade} ${change.nextState.paymentMade}");
    // print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

void main() {
  Bloc.observer = CounterObserver();
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => PaymentScreen(),
    },
  ));
}
