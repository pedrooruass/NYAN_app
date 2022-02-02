import 'package:auto_size_text/auto_size_text.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class BottomLine extends StatelessWidget {
  final Color mainColor;
  final Color nextColor;
  final Color backColor;
  final void Function()? onPressedNext;
  final void Function()? onPressedBack;
  final bool isAutonomous;
  final int totalScore;
  final bool isTrophy;
  const BottomLine({
    Key? key,
    required this.mainColor,
    this.onPressedNext,
    this.onPressedBack,
    required this.nextColor,
    this.backColor = Colors.blue,
    this.isAutonomous = false,
    this.totalScore = 0,
    this.isTrophy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(
                "Total:",
                style: TextStyle(
                  fontSize: 33,
                  color: mainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              AutoSizeText(
                totalScore.toString(),
                style: TextStyle(
                  fontSize: 33,
                  color: AppColors.white,
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
                        width: MediaQuery.of(context).size.width * 0.215,
                        height: MediaQuery.of(context).size.height * 0.069,
                        decoration: BoxDecoration(
                          color: nextColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: AutoSizeText(
                          "Next",
                          style: TextStyle(
                            fontSize: 27.5,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.215,
                                height:
                                    MediaQuery.of(context).size.height * 0.069,
                                decoration: BoxDecoration(
                                  color: backColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: AutoSizeText(
                                  "Back",
                                  style: TextStyle(
                                    fontSize: 27.5,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.215,
                                height:
                                    MediaQuery.of(context).size.height * 0.069,
                                decoration: BoxDecoration(
                                  color: nextColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: isTrophy
                                    ? Icon(
                                        FontAwesomeIcons.trophy,
                                        color: AppColors.yellowGenius,
                                      )
                                    : AutoSizeText("Next",
                                        style: TextStyle(
                                          fontSize: 27.5,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                        )),
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
                            width: MediaQuery.of(context).size.width * 0.215,
                            height: MediaQuery.of(context).size.height * 0.069,
                            decoration: BoxDecoration(
                              color: backColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: AutoSizeText(
                              "Back",
                              style: TextStyle(
                                fontSize: 27.5,
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
