import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:provider/provider.dart';

class DriverControlledGameQuestionsWidget extends StatefulWidget {
  final bool isBlue;
  final Color mainColor;
  const DriverControlledGameQuestionsWidget({
    Key? key,
    required this.isBlue,
    required this.mainColor,
  }) : super(key: key);

  @override
  State<DriverControlledGameQuestionsWidget> createState() =>
      _DriverControlledGameQuestionsWidgetState();
}

class _DriverControlledGameQuestionsWidgetState
    extends State<DriverControlledGameQuestionsWidget> {
  CalcScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Storage?",
              points: widget.isBlue
                  ? controller.blueDriverControlled.value.fstorage
                  : controller.redDriverControlled.value.fstorage,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueDriverControlled.value.fstorage = value
                    : controller.redDriverControlled.value.fstorage = value;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Hub L1",
              points: widget.isBlue
                  ? controller.blueDriverControlled.value.fhl1
                  : controller.redDriverControlled.value.fhl1,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueDriverControlled.value.fhl1 = value
                    : controller.redDriverControlled.value.fhl1 = value;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Hub L2",
              points: widget.isBlue
                  ? controller.blueDriverControlled.value.fhl2
                  : controller.redDriverControlled.value.fhl2,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueDriverControlled.value.fhl2 = value
                    : controller.redDriverControlled.value.fhl2 = value;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Hub L3",
              points: widget.isBlue
                  ? controller.blueDriverControlled.value.fhl3
                  : controller.redDriverControlled.value.fhl3,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueDriverControlled.value.fhl3 = value
                    : controller.redDriverControlled.value.fhl3 = value;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Freight in Shared",
              points: widget.isBlue
                  ? controller.blueDriverControlled.value.fshared
                  : controller.redDriverControlled.value.fshared,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                widget.isBlue
                    ? controller.blueDriverControlled.value.fshared = value
                    : controller.redDriverControlled.value.fshared = value;
                controller.refreshClass();
              },
            );
          },
        ),
      ],
    );
  }
}
