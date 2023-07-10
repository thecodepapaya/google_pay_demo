import 'package:curie/app/app.dart';
import 'package:curie/presentation/pin_confirmation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'controller.dart';
part 'widgets/avatar.dart';
part 'widgets/bottom_sheet.dart';
part 'widgets/amount_field.dart';

class AmountPage extends StatelessWidget {
  const AmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _AmountBloc(context),
      child: Scaffold(
        backgroundColor: const Color(0xFF1b72e8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 24,
              ),
            ),
          ],
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Avatar(url: 'assets/human.jpeg'),
                SizedBox(width: 3),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                SizedBox(width: 3),
                _Avatar(url: 'assets/redbus.jpeg'),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Payment to Red bus',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '(redbus@oksbi)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            _AmountFormField(),
            SizedBox(height: 8),
            Text(
              'Payment via Billdesk',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Expanded(child: SizedBox()),
            _BottomSheet(),
          ],
        ),
      ),
    );
  }
}
