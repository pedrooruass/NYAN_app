import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/row_navigator_button_widget.dart';

class EndGameGameQuestionsWidget extends StatefulWidget {
  final bool isBlue;
  final Color mainColor;
  const EndGameGameQuestionsWidget(
      {Key? key, required this.isBlue, required this.mainColor})
      : super(key: key);

  @override
  State<EndGameGameQuestionsWidget> createState() =>
      _EndGameGameQuestionsWidgetState();
}

class _EndGameGameQuestionsWidgetState
    extends State<EndGameGameQuestionsWidget> {
  CalcScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return QuestionWidget(
              text: "Carousel Delivery",
              points: widget.isBlue
                  ? controller.blueEndGame.value.cD
                  : controller.redEndGame.value.cD,
              dividerColor: widget.mainColor,
              onPressedPlusLess: (value) {
                // Logica funcional mas nao sei se correta
                if (widget.isBlue) {
                  if (controller.blueEndGame.value.cD <= 10) {
                    controller.blueEndGame.value.cD = value;
                    if (controller.blueEndGame.value.cD > 10) {
                      controller.blueEndGame.value.cD -= 1;
                    }
                  }
                } else {
                  if (controller.redEndGame.value.cD <= 10) {
                    controller.redEndGame.value.cD = value;
                    if (controller.redEndGame.value.cD > 10) {
                      controller.redEndGame.value.cD -= 1;
                    }
                  }
                }
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Shipping Hub?",
              isPlussOrLess: false,
              width: 0.0008,
              index: widget.isBlue
                  ? controller.blueEndGame.value.shippingH
                  : controller.redEndGame.value.shippingH,
              name1: "Tipped",
              name2: "Balanced",
              dividerColor: widget.mainColor,
              onPressedIndex: (index) {
                widget.isBlue
                    ? controller.blueEndGame.value.shippingH = index
                    : controller.redEndGame.value.shippingH = index;
                controller.refreshClass();
              },
            );
          },
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Shared Hub?",
              width: 0.0008,
              isPlussOrLess: false,
              index: widget.isBlue
                  ? controller.blueEndGame.value.sharedH
                  : controller.redEndGame.value.sharedH,
              name1: "Balanced",
              name2: "Tipped",
              dividerColor: widget.mainColor,
              onPressedIndex: (index) {
                widget.isBlue
                    ? controller.blueEndGame.value.sharedH = index
                    : controller.redEndGame.value.sharedH = index;
                controller.refreshClass();
              },
            );
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
            robotParkedQuestion(true),
            robotParkedQuestion(false),
          ],
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Divider(
          color: widget.mainColor,
          thickness: 2,
        ),
        Obx(
          () {
            return QuestionWidget(
              text: "Capping?",
              isPlussOrLess: false,
              name1: "Zero",
              name2: "One",
              name3: "Two",
              index: widget.isBlue
                  ? controller.blueEndGame.value.capping
                  : controller.redEndGame.value.capping,
              dividerColor: widget.mainColor,
              onPressedIndex: (index) {
                widget.isBlue
                    ? controller.blueEndGame.value.capping = index
                    : controller.redEndGame.value.capping = index;
                controller.refreshClass();
              },
            );
          },
        ),
      ],
    );
  }

  Expanded robotParkedQuestion(bool isRobot1) {
    return Expanded(
      child: Column(
        children: [
          Text(
            isRobot1 ? "R1" : "R2",
            style: TextStyle(
              fontSize: 25,
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Obx(
            () {
              return RowNavigatorButtonWidget(
                width: 0.33,
                name1: "None",
                name2: "Partly",
                name3: "Full",
                indexSelected: widget.isBlue
                    ? isRobot1
                        ? controller.blueEndGame.value.parked1
                        : controller.blueEndGame.value.parked2
                    : isRobot1
                        ? controller.redEndGame.value.parked1
                        : controller.redEndGame.value.parked2,
                onTap: (index) {
                  widget.isBlue
                      ? isRobot1
                          ? controller.blueEndGame.value.parked1 = index
                          : controller.blueEndGame.value.parked2 = index
                      : isRobot1
                          ? controller.redEndGame.value.parked1 = index
                          : controller.redEndGame.value.parked2 = index;
                  controller.refreshClass();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
