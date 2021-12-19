import 'package:flutter/material.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:provider/provider.dart';

class AutonomousGameQuestionsWidget extends StatefulWidget {
  final Color mainColor;
  final bool isBlue;
  const AutonomousGameQuestionsWidget({ Key? key, required this.mainColor, required this.isBlue}) : super(key: key);

  @override
  State<AutonomousGameQuestionsWidget> createState() => _AutonomousGameQuestionsWidgetState();
}

class _AutonomousGameQuestionsWidgetState extends State<AutonomousGameQuestionsWidget> {
  int index = 0;

  late CalcScoreController controller;

  @override
  void initState() {
    controller = Provider.of<CalcScoreController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                robotParkedQuestion(text: "R1",),
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
                                        width: 0.4,
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
                                      width: 0.4,
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
                                        width: 0.4,
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
                                      width: 0.4,
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
      ],
    );
  }

  Widget robotParkedQuestion({required String text}) {
    return Expanded(
                child: Column(
                  children: [
                    QuestionWidget(
                      text: text,
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
                                      width: 0.42,
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
                                    width: 0.42,
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
                                      width: 0.42,
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
                                    width: 0.42,
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
              );
  }
}