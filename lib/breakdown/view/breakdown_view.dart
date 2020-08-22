import 'package:cashMeOutside/bloc/payment/payment_state.dart';
import 'package:cashMeOutside/bloc/payment_bloc.dart';
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
        body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
          return Text("There is data here");
        }));
  }
}
