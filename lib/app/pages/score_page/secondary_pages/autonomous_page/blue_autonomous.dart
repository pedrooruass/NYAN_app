import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';

class BlueAutonomous extends StatefulWidget {
  const BlueAutonomous({Key? key}) : super(key: key);

  @override
  State<BlueAutonomous> createState() => _BlueAutonomousState();
}

class _BlueAutonomousState extends State<BlueAutonomous> {
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
              'Autonomous',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: AppColors.green),
              textAlign: TextAlign.center,
            ),
            QuestionWidget(
              question: "Duck Delivered?",
              isTrueOrFalse: true,
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            ),
            QuestionWidget(
              question: "Freight in Storage?",
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            ),
            QuestionWidget(
              question: "Freight in Hub?",
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Where the Robots are Parked?",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.green,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                QuestionWidget(
                  question: "Storage Unit?",
                  useDivider: false,
                  mainColor: AppColors.green,
                  secondaryColor: AppColors.white,
                ),
                QuestionWidget(
                  question: "Warehouse?",
                  mainColor: AppColors.green,
                  secondaryColor: AppColors.white,
                ),
              ],
            ),
            QuestionWidget(
              question: "Freight Bonus?",
              isBonus: true,
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            ),
            const Spacer(),
            BottomLine(
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
              allianceColor: AppColors.secondary,
            )
          ],
        ),
      ),
    );
  }
}
