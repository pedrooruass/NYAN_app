import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/widgets/question_widget.dart';

class Autonomous1 extends StatefulWidget {
  const Autonomous1({Key? key}) : super(key: key);

  @override
  State<Autonomous1> createState() => _Autonomous1State();
}

class _Autonomous1State extends State<Autonomous1> {
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
              'Autonomous - 1',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: AppColors.green,
              ),
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
            const SizedBox(height: 15),
            Container(
              height: 55,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/FIRSTTech_iconHorz_RGB_reverse.png"),
                ),
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
                      color: AppColors.green,
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
                      color: AppColors.white,
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
