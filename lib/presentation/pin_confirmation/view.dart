import 'dart:ui';

import 'package:curie/app/app.dart';
import 'package:curie/presentation/confirmation_view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'controller.dart';
part 'widgets/keyboard.dart';
part 'widgets/upi_pin.dart';
part 'widgets/visibility_toggle.dart';

class UPIConfirmationPage extends StatelessWidget {
  final int amount;

  const UPIConfirmationPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    const pinLength = 4;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _UpiPinBloc(
            context: context,
            maxPinLength: pinLength,
            amount: amount,
          ),
        ),
        BlocProvider(
          create: (context) => _UpiPinVisibilityBloc(context),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF1b307d),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Axis Bank',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image.network(
                      'https://i0.wp.com/financebuddha.com/blog/wp-content/uploads/2016/12/23155635/UPI1.jpg?w=125&ssl=1',
                      height: 48,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Axis financial services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '₹ $amount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(height: 100),
                      _UpiPin(pinLength: pinLength),
                      Expanded(child: SizedBox()),
                      _Keyboard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
