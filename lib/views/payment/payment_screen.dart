import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/payment/payment_cubit.dart';

import 'payment_view.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PaymentCubit(23.40), child: PaymentView());
  }
}
