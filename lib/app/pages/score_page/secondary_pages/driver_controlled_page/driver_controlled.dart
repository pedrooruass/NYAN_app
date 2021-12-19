import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/blue_driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:nyan_app/app/pages/widgets/change_alliance_hint.dart';
import 'package:nyan_app/app/pages/widgets/name_row_widget.dart';
import 'package:provider/provider.dart';

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
  late CalcScoreController controller;

  @override
  void initState() {
    controller = Provider.of<CalcScoreController>(context, listen: false);
    super.initState();
  }

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
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.resetPoints()
                      : controller.redDriverControlled.resetPoints();
                });
              },
              mainColor: widget.mainColor,
              text: 'Driver Controlled',
            ),
            const Spacer(),
            // const SizedBox(
            //   height: 10,
            // ),
            QuestionWidget(
              text: "Freight in Storage?",
              points: widget.isBlue
                  ? controller.blueDriverControlled.fstorage
                  : controller.redDriverControlled.fstorage,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.fstorage = value
                      : controller.redDriverControlled.fstorage = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L1",
              points: widget.isBlue
                  ? controller.blueDriverControlled.fhl1
                  : controller.redDriverControlled.fhl1,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.fhl1 = value
                      : controller.redDriverControlled.fhl1 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L2",
              points: widget.isBlue
                  ? controller.blueDriverControlled.fhl2
                  : controller.redDriverControlled.fhl2,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.fhl2 = value
                      : controller.redDriverControlled.fhl2 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L3",
              points: widget.isBlue
                  ? controller.blueDriverControlled.fhl3
                  : controller.redDriverControlled.fhl3,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.fhl3 = value
                      : controller.redDriverControlled.fhl3 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Shared",
              points: widget.isBlue
                  ? controller.blueDriverControlled.fshared
                  : controller.redDriverControlled.fshared,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueDriverControlled.fshared = value
                      : controller.redDriverControlled.fshared = value;
                });
              },
            ),
            ChangeAllianceHintWidget(
              mainColor: widget.mainColor,
              secondaryAllianceColor: widget.secondaryAllianceColor,
            ),
            const Spacer(),
            BottomLine(
              mainColor: widget.mainColor,
              nextColor: AppColors.yellowGenius,
              backColor: AppColors.orange,
              onPressedNext: widget.onPressedNext,
              onPressedBack: widget.onPressedBack,
              totalScore: widget.isBlue
                  ? controller.calcBlueTotalScore()
                  : controller.calcRedTotalScore(),
            )
          ],
        ),
      ),
    );
  }
}
