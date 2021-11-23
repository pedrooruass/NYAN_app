import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/widgets/question_widget.dart';

class Autonomous2 extends StatefulWidget {
  const Autonomous2({Key? key}) : super(key: key);

  @override
  State<Autonomous2> createState() => _Autonomous2State();
}

class _Autonomous2State extends State<Autonomous2> {
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
            Text(
              'Autonomous',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
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
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Swipe to the left to change alliance",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 35,
                      color: AppColors.white,
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
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  BouncingWidget(
                    duration: const Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
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
            )
          ],
        ),
      ),
    );
  }
}
