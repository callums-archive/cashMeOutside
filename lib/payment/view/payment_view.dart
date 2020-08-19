import 'package:cashMeOutside/payment/bloc/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TEST")),
        body: Center(
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return TextFormField(initialValue: state.amountDue.toString());
              // return Text('${state.amountDue}');
            },
          ),
        ));
  }
}
