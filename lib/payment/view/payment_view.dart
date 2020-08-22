import 'package:cashMeOutside/payment/bloc/payment_events.dart';
import 'package:cashMeOutside/payment/bloc/payment_state.dart';
import 'package:cashMeOutside/payment/view/payment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Payment")),
        body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
          void payment(ad) {
            var t = context.bloc<PaymentBloc>();
            t.add(AddPayment(amount: ad));
            t.close();
            print(state.paymentMade);
          }

          return Column(children: <Widget>[
            RaisedButton(
              onPressed: () {
                print("pad");
                payment(1235.0);
              },
              child: Text(
                "Process",
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.greenAccent,
            ),
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
            PaymentForm()
          ]);
        }));
  }
}
