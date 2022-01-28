import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class PlusLessWidget extends StatelessWidget {
  final void Function(int)? onPressedPlusLess;
  final int points;
  const PlusLessWidget({
    Key? key,
    required this.onPressedPlusLess,
    this.points = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BouncingWidget(
            duration: const Duration(milliseconds: 100),
            scaleFactor: 1.5,
            onPressed: () {
              if (onPressedPlusLess != null) {
                if (points > 0) {
                  onPressedPlusLess!(points - 1);
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.040,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                "-",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Text(
            "$points",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          BouncingWidget(
            duration: const Duration(milliseconds: 100),
            scaleFactor: 1.5,
            onPressed: () {
              if (onPressedPlusLess != null) {
                onPressedPlusLess!(points + 1);
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.040,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                "+",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
