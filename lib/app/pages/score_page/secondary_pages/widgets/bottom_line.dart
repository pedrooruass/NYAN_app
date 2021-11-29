import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class BottomLine extends StatelessWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color nextColor;
  final Color backColor;
  final void Function()? onPressedNext;
  final void Function()? onPressedBack;
  final bool isAutonomous;
  final int totalScore;
  const BottomLine({
    Key? key,
    required this.mainColor,
    required this.secondaryColor,
    this.onPressedNext,
    this.onPressedBack,
    required this.nextColor,
    this.backColor = Colors.blue,
    this.isAutonomous = false,
    this.totalScore = 0,
  }) : super(key: key);

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
                totalScore.toString(),
                style: TextStyle(
                  fontSize: 35,
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              onPressedBack == null
                  ? BouncingWidget(
                      duration: const Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: onPressedNext ?? () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
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
                    )
                  : onPressedNext != null
                      ? Row(
                          children: [
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: onPressedBack ?? () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 90,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: backColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: onPressedNext ?? () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 90,
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
                        )
                      : BouncingWidget(
                          duration: const Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: onPressedBack ?? () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 50,
                            decoration: BoxDecoration(
                              color: backColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Back",
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
