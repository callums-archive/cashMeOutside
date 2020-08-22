import 'package:cashMeOutside/bloc/payment/payment_state.dart';
import 'package:cashMeOutside/bloc/payment_bloc.dart';
import 'package:cashMeOutside/payment/view/payment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Payment")),
        body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
          return Column(children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "Amount Due: ",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                    return Text(
                      "R${state.amountDue}",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    );
                  })
                ])),
            PaymentForm(state)
          ]);
        }));
  }
}
