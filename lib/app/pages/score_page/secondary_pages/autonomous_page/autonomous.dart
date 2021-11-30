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
  const Autonomous(
      {Key? key,
      required this.mainColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.onPressed})
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
                      fontSize: 35,
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
                      controller.autonomous.resetPoints();
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
              index: controller.autonomous.isDuckDelivered ? 1 : 0,
              isPlussOrLess: false,
              mainColor: widget.mainColor,
              name1: "No",
              name2: "Yes",
              onPressedIndex: (index) {
                setState(() {
                  controller.autonomous.isDuckDelivered = index != 0;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Storage?",
              points: controller.autonomous.fstorage,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.autonomous.fstorage = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub?",
              points: controller.autonomous.fhub,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.autonomous.fhub = value;
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
                        index: controller.autonomous.isRobot1Parked ? 1 : 0,
                        name1: "No",
                        name2: "Yes",
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            controller.autonomous.isRobot1Parked = index != 0;
                          });
                        },
                      ),
                      controller.autonomous.isRobot1Parked
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
                                    index: controller.autonomous.isR1PInStorageUnit ? 0 : 1,
                                    useDivider: false,
                                    onPressedIndex: (index) {
                                      setState(() {
                                        controller.autonomous.isR1PInStorageUnit = index != 1;
                                      });
                                    },
                                  ),
                                ),
                                QuestionWidget(
                                  isPlussOrLess: false,
                                  name1: "Partialy",
                                  name2: "Completely",
                                  width: 160.5,
                                  index: controller.autonomous.isR1PCompletely ? 1 : 0,
                                  useDivider: false,
                                  onPressedIndex: (index) {
                                    setState(() {
                                      controller.autonomous.isR1PCompletely = index != 0;
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
                        index: controller.autonomous.isRobot2Parked ? 1 : 0,
                        name1: "No",
                        name2: "Yes",
                        useDivider: false,
                        onPressedIndex: (index) {
                          setState(() {
                            controller.autonomous.isRobot2Parked = index != 0;
                          });
                        },
                      ),
                      controller.autonomous.isRobot2Parked
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
                                    index: controller.autonomous.isR2PInStorageUnit ? 0 : 1,
                                    useDivider: false,
                                    onPressedIndex: (index) {
                                      setState(() {
                                        controller.autonomous.isR2PInStorageUnit = index != 1;
                                      });
                                    },
                                  ),
                                ),
                                QuestionWidget(
                                  isPlussOrLess: false,
                                  name1: "Partialy",
                                  name2: "Completely",
                                  width: 160.5,
                                  index: controller.autonomous.isR2PCompletely ? 1 : 0,
                                  useDivider: false,
                                  onPressedIndex: (index) {
                                    setState(() {
                                      controller.autonomous.isR2PCompletely = index != 0;
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
              index: controller.autonomous.fBonus,
              mainColor: widget.mainColor,
              onPressedIndex: (index) {
                setState(() {
                  controller.autonomous.fBonus = index;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
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
            const Spacer(),
            BottomLine(
              mainColor: widget.mainColor,
              nextColor: AppColors.yellowGenius,
              isAutonomous: true,
              onPressedNext: widget.onPressed,
              totalScore: controller.calcTotalScore(),
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
