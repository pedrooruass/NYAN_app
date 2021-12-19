import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/blue_driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:nyan_app/app/pages/widgets/change_alliance_hint.dart';
import 'package:nyan_app/app/pages/widgets/name_row_widget.dart';
import 'package:provider/provider.dart';

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
                      ? controller.blueEndGame.resetPoints()
                      : controller.redEndGame.resetPoints();
                });
              },
              mainColor: widget.mainColor,
              text: 'End Game',
            ),
            QuestionWidget(
              text: "Carousel Delivery",
              points: widget.isBlue
                  ? controller.blueEndGame.cD
                  : controller.redEndGame.cD,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  // Logica funcional mas nao sei se correta
                  if (widget.isBlue) {
                    if (controller.blueEndGame.cD <= 10) {
                      controller.blueEndGame.cD = value;
                      if (controller.blueEndGame.cD > 10) {
                        controller.blueEndGame.cD -= 1;
                      }
                    }
                  } else {
                    if (controller.redEndGame.cD <= 10) {
                      controller.redEndGame.cD = value;
                      if (controller.redEndGame.cD > 10) {
                        controller.redEndGame.cD -= 1;
                      }
                    }
                  }
                });
              },
            ),
            QuestionWidget(
              text: "Shipping Hub?",
              isPlussOrLess: false,
              width: 0.32,
              index: widget.isBlue
                  ? controller.blueEndGame.shippingH
                  : controller.redEndGame.shippingH,
              name1: "Tipped",
              name2: "Balanced",
              mainColor: widget.mainColor,
              onPressedIndex: (index) {
                setState(() {
                  widget.isBlue
                      ? controller.blueEndGame.shippingH = index
                      : controller.redEndGame.shippingH = index;
                });
              },
            ),
            QuestionWidget(
              text: "Shared Hub?",
              width: 0.32,
              isPlussOrLess: false,
              index: widget.isBlue
                  ? controller.blueEndGame.sharedH
                  : controller.redEndGame.sharedH,
              name1: "Balanced",
              name2: "Tipped",
              mainColor: widget.mainColor,
              onPressedIndex: (index) {
                setState(() {
                  widget.isBlue
                      ? controller.blueEndGame.sharedH = index
                      : controller.redEndGame.sharedH = index;
                });
              },
            ),
            Center(
              child: Text(
                "Robots Parking?",
                style: TextStyle(
                  fontSize: 25,
                  color: widget.mainColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "R1",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      QuestionWidget(
                        isPlussOrLess: false,
                        width: 0.33,
                        name1: "None",
                        name2: "Partly",
                        name3: "Full",
                        index: widget.isBlue
                            ? controller.blueEndGame.parked1
                            : controller.redEndGame.parked1,
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            widget.isBlue
                                ? controller.blueEndGame.parked1 = index
                                : controller.redEndGame.parked1 = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "R2",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      QuestionWidget(
                        isPlussOrLess: false,
                        width: 0.33,
                        name1: "None",
                        name2: "Partly",
                        name3: "Full",
                        index: widget.isBlue
                            ? controller.blueEndGame.parked2
                            : controller.redEndGame.parked2,
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            widget.isBlue
                                ? controller.blueEndGame.parked2 = index
                                : controller.redEndGame.parked2 = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: widget.mainColor,
              thickness: 2,
            ),
            QuestionWidget(
              text: "Capping?",
              isPlussOrLess: false,
              name1: "Zero",
              name2: "One",
              name3: "Two",
              index: widget.isBlue
                  ? controller.blueEndGame.capping
                  : controller.redEndGame.capping,
              mainColor: widget.mainColor,
              onPressedIndex: (index) {
                setState(() {
                  widget.isBlue
                      ? controller.blueEndGame.capping = index
                      : controller.redEndGame.capping = index;
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
              nextColor: AppColors.black,
              backColor: AppColors.orange,
              onPressedBack: widget.onPressedBack,
              onPressedNext: widget.onPressedNext,
              isTrophy: true,
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
