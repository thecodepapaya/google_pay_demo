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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _Avatar(
                  url:
                      'https://img.freepik.com/free-photo/human-face-expressions-emotions-positive-joyful-young-beautiful-female-with-fair-straight-hair-casual-clothing_176420-15188.jpg?w=100',
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                SizedBox(width: 3),
                _Avatar(
                  url:
                      'https://play-lh.googleusercontent.com/pOhc9TAENgN1MXuU42s6tiT7KCJ-PSl7zoSH9r_AfIx-rkfIOHNvJHanJPw-HBa09w',
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Payment to Red bus',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '(redbus@oksbi)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            const _AmountFormField(),
            const SizedBox(height: 8),
            const Text(
              'Payment via Billdesk',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Expanded(child: SizedBox()),
            const _BottomSheet(),
          ],
        ),
      ),
    );
  }
}