import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/widgets/alliance_winner_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/widgets/confetti_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/widgets/score_details_widget.dart';

class FinalScore extends StatefulWidget {
  const FinalScore({Key? key}) : super(key: key);

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  CalcScoreController controller = Get.find();
  ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Final Score Dashboard",
                  style: TextStyle(
                    fontSize: 33,
                    // color: AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: const [
                  ScoreDetailsWidget(isBlue: true),
                  ScoreDetailsWidget(isBlue: false),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (controller.calcBlueTotalScore() >
                  controller.calcRedTotalScore())
                AllianceWinnerWidget(
                  confettiController: confettiController,
                  isBlue: true,
                ),
              if (controller.calcRedTotalScore() >
                  controller.calcBlueTotalScore())
                AllianceWinnerWidget(
                  confettiController: confettiController,
                  isBlue: false,
                ),

              if (controller.calcBlueTotalScore() ==
                  controller.calcRedTotalScore())
                Column(
                  children: [
                    Center(
                      child: Text(
                        "The match ended in a Draw!!!",
                        style: TextStyle(
                          fontSize: 27,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/duck.gif",
                      height: 200,
                    ),
                  ],
                ),
              // Put trofeu image or gif
            ],
          ),
          if (controller.calcBlueTotalScore() > controller.calcRedTotalScore())
            WinConfettiWidget(
              confettiController: confettiController,
              teamColor: AppColors.primary,
            ),
          if (controller.calcRedTotalScore() > controller.calcBlueTotalScore())
            WinConfettiWidget(
              confettiController: confettiController,
              teamColor: AppColors.secondary,
            ),
        ],
      ),
    );
  }
}
