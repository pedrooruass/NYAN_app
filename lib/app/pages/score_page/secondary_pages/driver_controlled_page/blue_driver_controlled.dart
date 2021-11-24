import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';

class BlueDriverControlled extends StatefulWidget {
  const BlueDriverControlled({Key? key}) : super(key: key);

  @override
  _BlueDriverControlledState createState() => _BlueDriverControlledState();
}

class _BlueDriverControlledState extends State<BlueDriverControlled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
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
                  color: AppColors.orange),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            BottomLine(
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
