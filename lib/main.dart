import 'package:bloc/bloc.dart';
import 'package:cashMeOutside/breakdown/view/breakdown_page.dart';
import 'package:cashMeOutside/payment/view/payment_page.dart';
import 'package:flutter/material.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

void main() {
  Bloc.observer = CounterObserver();
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => PaymentPage(),
      "/breakdown": (context) => BreakdownPage()
    },
  ));
}
