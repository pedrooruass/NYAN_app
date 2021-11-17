import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class StartButton extends StatefulWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.secondary, spreadRadius: 5, blurRadius: 10)
          ],
        ),
        height: 50,
        width: 200,
        child: const Text(
          'Start',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
