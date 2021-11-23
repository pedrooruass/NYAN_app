import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Autonomous',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: AppColors.green),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 15),
                BouncingWidget(
                  child: Icon(
                    FontAwesomeIcons.redo,
                    color: AppColors.white,
                    size: 18,
                  ),
                  onPressed: (){
                    setState(() {
                      // QuestionWidget.resetPoints();
                    });
                  },
                ),
              ],
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
            Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Swipe to the left to change alliance",
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
            const Spacer(),
            BottomLine(
              mainColor: AppColors.green,
              secondaryColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
