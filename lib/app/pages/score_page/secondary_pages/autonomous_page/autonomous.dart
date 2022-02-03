import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/widgets/autonomous_game_questions_widget.dart';
import 'package:nyan_app/app/pages/widgets/change_alliance_hint.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/widgets/name_row_widget.dart';

class Autonomous extends StatefulWidget {
  final Color mainColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final void Function() onPressed;
  final bool isBlue;
  const Autonomous(
      {Key? key,
      required this.mainColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.onPressed,
      this.isBlue = true})
      : super(key: key);

  @override
  State<Autonomous> createState() => _AutonomousState();
}

class _AutonomousState extends State<Autonomous> {
  int index = 0;
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
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            NameRowWidget(
              onPressed: () {
                widget.isBlue
                    ? controller.blueAutonomous.value.resetPoints()
                    : controller.redAutonomous.value.resetPoints();
                controller.refreshClass();
              },
              mainColor: widget.mainColor,
              text: 'Autonomous',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.003,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AutonomousGameQuestionsWidget(
                      mainColor: widget.mainColor,
                      isBlue: widget.isBlue,
                    ),
                    ChangeAllianceHintWidget(
                      mainColor: widget.mainColor,
                      secondaryAllianceColor: widget.secondaryAllianceColor,
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            // const Spacer(),
            Obx(
              () {
                return BottomLine(
                  mainColor: widget.mainColor,
                  nextColor: AppColors.yellowGenius,
                  isAutonomous: true,
                  onPressedNext: widget.onPressed,
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
