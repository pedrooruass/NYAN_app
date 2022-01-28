import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/end_game_page/widgets/end_game_game_questions_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/widgets/change_alliance_hint.dart';
import 'package:nyan_app/app/pages/widgets/name_row_widget.dart';

class EndGame extends StatefulWidget {
  final Color mainColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final void Function() onPressedBack;
  final void Function() onPressedNext;
  final bool isBlue;
  const EndGame({
    Key? key,
    required this.mainColor,
    required this.allianceColor,
    required this.secondaryAllianceColor,
    required this.onPressedBack,
    required this.onPressedNext,
    this.isBlue = true,
  }) : super(key: key);

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  CalcScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.allianceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            NameRowWidget(
              onPressed: () {
                widget.isBlue
                    ? controller.blueEndGame.value.resetPoints()
                    : controller.redEndGame.value.resetPoints();
                controller.refreshClass();
              },
              mainColor: widget.mainColor,
              text: 'End Game',
            ),
            EndGameGameQuestionsWidget(
              isBlue: widget.isBlue,
              mainColor: widget.mainColor,
            ),
            ChangeAllianceHintWidget(
              mainColor: widget.mainColor,
              secondaryAllianceColor: widget.secondaryAllianceColor,
            ),
            const Spacer(),
            Obx(
              () {
                return BottomLine(
                  mainColor: widget.mainColor,
                  nextColor: AppColors.black,
                  backColor: AppColors.orange,
                  onPressedBack: widget.onPressedBack,
                  onPressedNext: widget.onPressedNext,
                  isTrophy: true,
                  totalScore: widget.isBlue
                      ? controller.calcBlueTotalScore()
                      : controller.calcRedTotalScore(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
