import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/plus_less_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/row_navigator_button_widget.dart';

class AutonomousGameQuestionsWidget extends StatefulWidget {
  final Color mainColor;
  final bool isBlue;
  const AutonomousGameQuestionsWidget(
      {Key? key, required this.mainColor, required this.isBlue})
      : super(key: key);

  @override
  State<AutonomousGameQuestionsWidget> createState() =>
      _AutonomousGameQuestionsWidgetState();
}

class _AutonomousGameQuestionsWidgetState
    extends State<AutonomousGameQuestionsWidget> {
  int index = 0;

  CalcScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return QuestionWidget(
              text: "Duck Delivered?",
              index: widget.isBlue
                  ? controller.blueAutonomous.value.isDuckDelivered
                      ? 1
                      : 0
                  : controller.redAutonomous.value.isDuckDelivered
                      ? 1
                      : 0,
              isPlussOrLess: false,
              dividerColor: widget.mainColor,
              name1: "No",
              name2: "Yes",
              onPressedIndex: (index) {
                final blueAutonomous = controller.blueAutonomous;
                blueAutonomous.value.isDuckDelivered = index != 0;
                widget.isBlue
                    ? controller.blueAutonomous = blueAutonomous
                    : controller.redAutonomous.value.isDuckDelivered =
                        index != 0;

                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Storage?",
              points: widget.isBlue
                  ? controller.blueAutonomous.value.fstorage
                  : controller.redAutonomous.value.fstorage,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueAutonomous.value.fstorage = value
                    : controller.redAutonomous.value.fstorage = value;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Hub?",
              points: widget.isBlue
                  ? controller.blueAutonomous.value.fhub
                  : controller.redAutonomous.value.fhub,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueAutonomous.value.fhub = value
                    : controller.redAutonomous.value.fhub = value;
                controller.refreshClass();
              },
            );
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
            robotParkedQuestion(isRobot1: true),
            SizedBox(width: MediaQuery.of(context).size.width * 0.035),
            robotParkedQuestion(isRobot1: false),
          ],
        ),
        Divider(
          color: widget.mainColor,
          thickness: 2,
        ),
        Obx(
          () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Freight Bonus?",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "1 && 2",
                      style: TextStyle(
                        fontSize: 21,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Column(
                  children: [
                    RowNavigatorButtonWidget(
                      onTap: (index) {
                        widget.isBlue
                            ? controller.blueAutonomous.value.fBonus1 = index
                            : controller.redAutonomous.value.fBonus1 = index;
                        controller.refreshClass();
                      },
                      indexSelected: widget.isBlue
                          ? controller.blueAutonomous.value.fBonus1
                          : controller.redAutonomous.value.fBonus1,
                      name1: "None",
                      name2: "Duck",
                      name3: "Team",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    RowNavigatorButtonWidget(
                      onTap: (index) {
                        widget.isBlue
                            ? controller.blueAutonomous.value.fBonus2 = index
                            : controller.redAutonomous.value.fBonus2 = index;
                        controller.refreshClass();
                      },
                      indexSelected: widget.isBlue
                          ? controller.blueAutonomous.value.fBonus2
                          : controller.redAutonomous.value.fBonus2,
                      name1: "None",
                      name2: "Duck",
                      name3: "Team",
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        Divider(
          color: widget.mainColor,
          thickness: 2,
        ), // Copy Divider
      ],
    );
  }

  Widget robotParkedQuestion({
    required bool isRobot1,
  }) {
    return Expanded(
      child: Column(
        children: [
          Obx(
            () {
              return QuestionWidget(
                text: isRobot1 ? "R1" : "R2",
                isPlussOrLess: false,
                index: widget.isBlue
                    ? isRobot1
                        ? controller.blueAutonomous.value.isRobot1Parked
                            ? 1
                            : 0
                        : controller.blueAutonomous.value.isRobot2Parked
                            ? 1
                            : 0
                    : isRobot1
                        ? controller.redAutonomous.value.isRobot1Parked
                            ? 1
                            : 0
                        : controller.redAutonomous.value.isRobot2Parked
                            ? 1
                            : 0,
                name1: "No",
                name2: "Yes",
                useDivider: false,
                onPressedIndex: (index) {
                  widget.isBlue
                      ? isRobot1
                          ? controller.blueAutonomous.value.isRobot1Parked =
                              index != 0
                          : controller.blueAutonomous.value.isRobot2Parked =
                              index != 0
                      : isRobot1
                          ? controller.redAutonomous.value.isRobot1Parked =
                              index != 0
                          : controller.redAutonomous.value.isRobot2Parked =
                              index != 0;
                  controller.refreshClass();
                },
              );
            },
          ),
          // Preciso verificar se e vermelho e se e robo 1, ms fzr com q seja individual; um de cada vez do mesmo jeito q esta no corpo
          Obx(
            () {
              return widget.isBlue
                  ? isRobot1
                      ? controller.blueAutonomous.value.isRobot1Parked
                          ? parkingOptions(isRobot1)
                          : const SizedBox()
                      : controller.blueAutonomous.value.isRobot2Parked
                          ? parkingOptions(isRobot1)
                          : const SizedBox()
                  : isRobot1
                      ? controller.redAutonomous.value.isRobot1Parked
                          ? parkingOptions(isRobot1)
                          : const SizedBox()
                      : controller.redAutonomous.value.isRobot2Parked
                          ? parkingOptions(isRobot1)
                          : const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Widget parkingOptions(bool isRobot1) {
    return Column(
      children: [
        Obx(
          () {
            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.013,
              ),
              child: RowNavigatorButtonWidget(
                name1: "Storage",
                name2: "Warehouse",
                width: MediaQuery.of(context).size.width *
                    0.0009999, // Random shit that works
                indexSelected: widget.isBlue
                    ? isRobot1
                        ? controller.blueAutonomous.value.isR1PInStorageUnit
                            ? 0
                            : 1
                        : controller.blueAutonomous.value.isR2PInStorageUnit
                            ? 0
                            : 1
                    : isRobot1
                        ? controller.redAutonomous.value.isR1PInStorageUnit
                            ? 0
                            : 1
                        : controller.redAutonomous.value.isR2PInStorageUnit
                            ? 0
                            : 1,
                onTap: (index) {
                  widget.isBlue
                      ? isRobot1
                          ? controller.blueAutonomous.value.isR1PInStorageUnit =
                              index != 1
                          : controller.blueAutonomous.value.isR2PInStorageUnit =
                              index != 1
                      : isRobot1
                          ? controller.redAutonomous.value.isR1PInStorageUnit =
                              index != 1
                          : controller.redAutonomous.value.isR2PInStorageUnit =
                              index != 1;
                  controller.refreshClass();
                },
              ),
            );
          },
        ),
        Obx(
          () {
            return RowNavigatorButtonWidget(
              name1: "Partialy",
              name2: "Completely",
              width: MediaQuery.of(context).size.width * 0.0009999,
              indexSelected: widget.isBlue
                  ? isRobot1
                      ? controller.blueAutonomous.value.isR1PCompletely
                          ? 1
                          : 0
                      : controller.blueAutonomous.value.isR2PCompletely
                          ? 1
                          : 0
                  : isRobot1
                      ? controller.redAutonomous.value.isR1PCompletely
                          ? 1
                          : 0
                      : controller.redAutonomous.value.isR2PCompletely
                          ? 1
                          : 0,
              onTap: (index) {
                widget.isBlue
                    ? isRobot1
                        ? controller.blueAutonomous.value.isR1PCompletely =
                            index != 0
                        : controller.blueAutonomous.value.isR2PCompletely =
                            index != 0
                    : isRobot1
                        ? controller.redAutonomous.value.isR1PCompletely =
                            index != 0
                        : controller.redAutonomous.value.isR2PCompletely =
                            index != 0;
                controller.refreshClass();
              },
            );
          },
        ),
      ],
    );
  }
}
