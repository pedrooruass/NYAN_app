import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class Autonomous2 extends StatefulWidget {
  const Autonomous2({Key? key}) : super(key: key);

  @override
  State<Autonomous2> createState() => _Autonomous2State();
}

class _Autonomous2State extends State<Autonomous2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Autonomous - 2',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 35,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
