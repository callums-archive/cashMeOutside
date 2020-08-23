// import 'package:cashMeOutside/bloc/payment_bloc.dart';
import 'package:cashMeOutside/breakdown/view/breakdown_view.dart';
import 'package:cashMeOutside/cubit/payment/payment_cubit.dart';
import 'package:cashMeOutside/payment/view/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakdownPage extends StatelessWidget {
  const BreakdownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
        create: (_) => BlocProvider.of<PaymentCubit>(context),
        child: BreakdownView());
  }
}
