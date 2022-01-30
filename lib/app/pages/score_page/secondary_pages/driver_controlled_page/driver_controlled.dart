import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/widget/driver_controlled_game_questions_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/widgets/change_alliance_hint.dart';
import 'package:nyan_app/app/pages/widgets/name_row_widget.dart';
class DriverControlled extends StatefulWidget {
  final Color mainColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final void Function() onPressedNext;
  final void Function() onPressedBack;
  final bool isBlue;
  const DriverControlled(
      {Key? key,
      required this.mainColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.onPressedNext,
      required this.onPressedBack,
      this.isBlue = true})
      : super(key: key);

  @override
  State<DriverControlled> createState() => _DriverControlledState();
}

class _DriverControlledState extends State<DriverControlled> {
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            NameRowWidget(
              onPressed: () {
                widget.isBlue
                    ? controller.blueDriverControlled.value.resetPoints()
                    : controller.redDriverControlled.value.resetPoints();
                controller.refreshClass();
              },
              mainColor: widget.mainColor,
              text: 'Driver Controlled',
            ),
            const Spacer(),
            DriverControlledGameQuestionsWidget(
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
                  nextColor: AppColors.yellowGenius,
                  backColor: AppColors.orange,
                  onPressedNext: widget.onPressedNext,
                  onPressedBack: widget.onPressedBack,
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
