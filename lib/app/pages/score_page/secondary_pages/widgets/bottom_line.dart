import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class BottomLine extends StatelessWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color nextColor;
  final void Function() onPressed;
  const BottomLine(
      {Key? key,
      required this.mainColor,
      required this.secondaryColor,
      required this.onPressed, required this.nextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Total:",
                style: TextStyle(
                  fontSize: 35,
                  color: mainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "30",
                style: TextStyle(
                  fontSize: 35,
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              BouncingWidget(
                duration: const Duration(milliseconds: 100),
                scaleFactor: 1.5,
                onPressed: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: nextColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 35,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
