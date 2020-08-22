import 'package:cashMeOutside/payment/bloc/payment_bloc.dart';
import 'package:cashMeOutside/payment/bloc/payment_events.dart';
import 'package:cashMeOutside/tools/decimal_text_input_formatter.dart';
import 'package:cashMeOutside/tools/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentForm extends StatefulWidget {
  @override
  PaymentFormState createState() {
    return PaymentFormState();
  }
}

class PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
              ),
            ),
          )),
          Column(children: <Widget>[
            SizedBox(
                width: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    print("boom");
                    context.bloc<PaymentBloc>().add(AddPayment(amount: 33.33));

                    if (_formKey.currentState.validate()) {
                      showSnackBar(
                          context, "Please Wait...", Colors.blueAccent);
                    }
                  },
                  child: Text(
                    "Process",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.greenAccent,
                ))
          ])
        ],
      )),
    );
  }
}
