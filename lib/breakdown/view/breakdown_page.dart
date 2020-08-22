import 'package:cashMeOutside/bloc/payment_bloc.dart';
import 'package:cashMeOutside/breakdown/view/breakdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakdownPage extends StatelessWidget {
  const BreakdownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PaymentBloc(35.00), child: BreakdownView());
  }
}
