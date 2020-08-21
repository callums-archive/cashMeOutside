import 'package:cashMeOutside/payment/bloc/payment_state.dart';
import 'package:cashMeOutside/payment/tools/decimal_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Payment")),
        body: Column(children: <Widget>[
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
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  );
                })
              ])),
          Expanded(
              child: Center(
                  child: Container(
            padding: EdgeInsets.all(20.0),
            child: BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                return TextFormField(
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    hintText: "Payment Amount",
                    isDense: true,
                    prefixIcon: Text(
                      "R ",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0.0, minHeight: 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    DecimalTextInputFormatter()
                  ],
                );
              },
            ),
          ))),
          Container(
              child: SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Process",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.greenAccent,
                  )))
        ]));
  }
}
