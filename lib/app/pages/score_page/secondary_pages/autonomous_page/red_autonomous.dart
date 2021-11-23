import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';

class RedAutonomous extends StatefulWidget {
  const RedAutonomous({Key? key}) : super(key: key);

  @override
  State<RedAutonomous> createState() => _RedAutonomousState();
}

class _RedAutonomousState extends State<RedAutonomous> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Autonomous',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 15),
                BouncingWidget(
                  child: Icon(
                    FontAwesomeIcons.redo,
                    color: AppColors.black,
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
              mainColor: AppColors.white,
              secondaryColor: AppColors.black,
            ),
            QuestionWidget(
              question: "Freight in Storage?",
              mainColor: AppColors.white,
              secondaryColor: AppColors.black,
            ),
            QuestionWidget(
              question: "Freight in Hub?",
              mainColor: AppColors.white,
              secondaryColor: AppColors.black,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Where the Robots are Parked?",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                QuestionWidget(
                  question: "Storage Unit?",
                  useDivider: false,
                  mainColor: AppColors.white,
                  secondaryColor: AppColors.black,
                ),
                QuestionWidget(
                  question: "Warehouse?",
                  mainColor: AppColors.white,
                  secondaryColor: AppColors.black,
                ),
              ],
            ),
            QuestionWidget(
              question: "Freight Bonus?",
              isBonus: true,
              mainColor: AppColors.white,
              secondaryColor: AppColors.black,
            ),
            const Spacer(),
            BottomLine(
              mainColor: AppColors.white,
              secondaryColor: AppColors.black,
              allianceColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
