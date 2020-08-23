import 'package:cashMeOutside/cubit/payment/payment_cubit.dart';
import 'package:cashMeOutside/cubit/payment/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakdownView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Breakdown"),
          backgroundColor: Colors.greenAccent,
        ),
        body:
            BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
          return Text("state => $state");
        }));
  }
}
