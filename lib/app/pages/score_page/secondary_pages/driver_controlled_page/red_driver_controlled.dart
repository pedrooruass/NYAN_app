import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class RedDriverControlled extends StatefulWidget {
  const RedDriverControlled({Key? key}) : super(key: key);

  @override
  _RedDriverControlledState createState() => _RedDriverControlledState();
}

class _RedDriverControlledState extends State<RedDriverControlled> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              'Driver Controlled',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
