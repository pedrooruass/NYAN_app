import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:provider/provider.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Autonomous',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 33,
                      color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 15),
                BouncingWidget(
                  child: Icon(
                    FontAwesomeIcons.redo,
                    color: widget.mainColor,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isBlue
                          ? controller.blueAutonomous.resetPoints()
                          : controller.redAutonomous.resetPoints();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            QuestionWidget(
              text: "Duck Delivered?",
              index: widget.isBlue
                  ? controller.blueAutonomous.isDuckDelivered
                      ? 1
                      : 0
                  : controller.redAutonomous.isDuckDelivered
                      ? 1
                      : 0,
              isPlussOrLess: false,
              mainColor: widget.mainColor,
              name1: "No",
              name2: "Yes",
              onPressedIndex: (index) {
                setState(() {
                  widget.isBlue
                      ? controller.blueAutonomous.isDuckDelivered = index != 0
                      : controller.redAutonomous.isDuckDelivered = index != 0;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Storage?",
              points: widget.isBlue
                  ? controller.blueAutonomous.fstorage
                  : controller.redAutonomous.fstorage,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueAutonomous.fstorage = value
                      : controller.redAutonomous.fstorage = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub?",
              points: widget.isBlue
                  ? controller.blueAutonomous.fhub
                  : controller.redAutonomous.fhub,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.isBlue
                      ? controller.blueAutonomous.fhub = value
                      : controller.redAutonomous.fhub = value;
                });
              },
            ),
            Center(
              child: Text(
                "Parking Robots",
                style: TextStyle(
                  fontSize: 25,
                  color: widget.mainColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      QuestionWidget(
                        text: "R1",
                        isPlussOrLess: false,
                        index: widget.isBlue
                            ? controller.blueAutonomous.isRobot1Parked
                                ? 1
                                : 0
                            : controller.redAutonomous.isRobot1Parked
                                ? 1
                                : 0,
                        name1: "No",
                        name2: "Yes",
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            widget.isBlue
                                ? controller.blueAutonomous.isRobot1Parked =
                                    index != 0
                                : controller.redAutonomous.isRobot1Parked =
                                    index != 0;
                          });
                        },
                      ),
                      widget.isBlue
                          ? controller.blueAutonomous.isRobot1Parked
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.5, bottom: 10),
                                      child: QuestionWidget(
                                        isPlussOrLess: false,
                                        name1: "Storage",
                                        name2: "Warehouse",
                                        width: 160.5,
                                        index: controller.blueAutonomous
                                                .isR1PInStorageUnit
                                            ? 0
                                            : 1,
                                        useDivider: false,
                                        onPressedIndex: (index) {
                                          setState(() {
                                            controller.blueAutonomous
                                                    .isR1PInStorageUnit =
                                                index != 1;
                                          });
                                        },
                                      ),
                                    ),
                                    QuestionWidget(
                                      isPlussOrLess: false,
                                      name1: "Partialy",
                                      name2: "Completely",
                                      width: 160.5,
                                      index: controller
                                              .blueAutonomous.isR1PCompletely
                                          ? 1
                                          : 0,
                                      useDivider: false,
                                      onPressedIndex: (index) {
                                        setState(() {
                                          controller.blueAutonomous
                                              .isR1PCompletely = index != 0;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox()
                          : controller.redAutonomous.isRobot1Parked
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.5, bottom: 10),
                                      child: QuestionWidget(
                                        isPlussOrLess: false,
                                        name1: "Storage",
                                        name2: "Warehouse",
                                        width: 160.5,
                                        index: controller.redAutonomous
                                                .isR1PInStorageUnit
                                            ? 0
                                            : 1,
                                        useDivider: false,
                                        onPressedIndex: (index) {
                                          setState(() {
                                            controller.redAutonomous
                                                    .isR1PInStorageUnit =
                                                index != 1;
                                          });
                                        },
                                      ),
                                    ),
                                    QuestionWidget(
                                      isPlussOrLess: false,
                                      name1: "Partialy",
                                      name2: "Completely",
                                      width: 160.5,
                                      index: controller
                                              .redAutonomous.isR1PCompletely
                                          ? 1
                                          : 0,
                                      useDivider: false,
                                      onPressedIndex: (index) {
                                        setState(() {
                                          controller.redAutonomous
                                              .isR1PCompletely = index != 0;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      QuestionWidget(
                        text: "R2",
                        isPlussOrLess: false,
                        index: widget.isBlue
                            ? controller.blueAutonomous.isRobot2Parked
                                ? 1
                                : 0
                            : controller.redAutonomous.isRobot2Parked
                                ? 1
                                : 0,
                        name1: "No",
                        name2: "Yes",
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            widget.isBlue
                                ? controller.blueAutonomous.isRobot2Parked =
                                    index != 0
                                : controller.redAutonomous.isRobot2Parked =
                                    index != 0;
                          });
                        },
                      ),
                      widget.isBlue
                          ? controller.blueAutonomous.isRobot2Parked
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.5, bottom: 10),
                                      child: QuestionWidget(
                                        isPlussOrLess: false,
                                        name1: "Storage",
                                        name2: "Warehouse",
                                        width: 160.5,
                                        index: controller.blueAutonomous
                                                .isR2PInStorageUnit
                                            ? 0
                                            : 1,
                                        useDivider: false,
                                        onPressedIndex: (index) {
                                          setState(() {
                                            controller.blueAutonomous
                                                    .isR2PInStorageUnit =
                                                index != 1;
                                          });
                                        },
                                      ),
                                    ),
                                    QuestionWidget(
                                      isPlussOrLess: false,
                                      name1: "Partialy",
                                      name2: "Completely",
                                      width: 160.5,
                                      index: controller
                                              .blueAutonomous.isR2PCompletely
                                          ? 1
                                          : 0,
                                      useDivider: false,
                                      onPressedIndex: (index) {
                                        setState(() {
                                          controller.blueAutonomous
                                              .isR2PCompletely = index != 0;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox()
                          : controller.redAutonomous.isRobot2Parked
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.5, bottom: 10),
                                      child: QuestionWidget(
                                        isPlussOrLess: false,
                                        name1: "Storage",
                                        name2: "Warehouse",
                                        width: 160.5,
                                        index: controller.redAutonomous
                                                .isR2PInStorageUnit
                                            ? 0
                                            : 1,
                                        useDivider: false,
                                        onPressedIndex: (index) {
                                          setState(() {
                                            controller.redAutonomous
                                                    .isR2PInStorageUnit =
                                                index != 1;
                                          });
                                        },
                                      ),
                                    ),
                                    QuestionWidget(
                                      isPlussOrLess: false,
                                      name1: "Partialy",
                                      name2: "Completely",
                                      width: 160.5,
                                      index: controller
                                              .redAutonomous.isR2PCompletely
                                          ? 1
                                          : 0,
                                      useDivider: false,
                                      onPressedIndex: (index) {
                                        setState(() {
                                          controller.redAutonomous
                                              .isR2PCompletely = index != 0;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: widget.mainColor,
              thickness: 2,
            ),
            QuestionWidget(
              text: "Freight Bonus?",
              name1: "None",
              name2: "Duck",
              name3: "Team",
              isPlussOrLess: false,
              index: widget.isBlue
                  ? controller.blueAutonomous.fBonus
                  : controller.redAutonomous.fBonus,
              mainColor: widget.mainColor,
              onPressedIndex: (index) {
                setState(() {
                  widget.isBlue
                      ? controller.blueAutonomous.fBonus = index
                      : controller.redAutonomous.fBonus = index;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(1.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: widget.mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Swipe left to change alliance",
                  style: TextStyle(
                    color: widget.secondaryAllianceColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Spacer(),
            BottomLine(
              mainColor: widget.mainColor,
              nextColor: AppColors.yellowGenius,
              isAutonomous: true,
              onPressedNext: widget.onPressed,
              totalScore: widget.isBlue
                  ? controller.calcBlueTotalScore()
                  : controller.calcRedTotalScore(),
            )
          ],
        ),
      ),
    );
  }

  // Expanded parkingRobot1() {
  //   return
  // }
}
