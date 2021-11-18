import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class Autonomous1 extends StatefulWidget {
  const Autonomous1({Key? key}) : super(key: key);

  @override
  State<Autonomous1> createState() => _Autonomous1State();
}

class _Autonomous1State extends State<Autonomous1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
          children: [
             Text(
              'Autonomous1',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
      ),
    );
  }
}
