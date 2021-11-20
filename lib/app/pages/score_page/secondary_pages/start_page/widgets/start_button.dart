import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class StartButton extends StatefulWidget {
  final void Function() onPressed;
  const StartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: widget.onPressed,
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
        height: 64,
        width: 200,
        child:  Text(
          'Start',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
