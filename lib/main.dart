import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

void main() {
  Bloc.observer = CounterObserver();
  runApp(PaymentApp());
}
