import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:provider/provider.dart';

class EndGame extends StatefulWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final void Function() onPressedBack;
  final void Function() onPressedNext;
  const EndGame({
    Key? key,
    required this.mainColor,
    required this.secondaryColor,
    required this.allianceColor,
    required this.secondaryAllianceColor,
    required this.onPressedBack,
    required this.onPressedNext,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'End Game',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: widget.mainColor),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 18),
                  child: BouncingWidget(
                    child: Icon(
                      FontAwesomeIcons.redo,
                      color: widget.secondaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.endGame.resetPoints();
                      });
                    },
                  ),
                ),
              ],
            ),
            QuestionWidget(
              text: "Carousel Delivery",
              mainColor: widget.mainColor,
              secondaryColor: widget.secondaryColor,
              points: controller.endGame.cD,
              onPressedPlusLess: (value) {
                setState(() {
                  // Logica funcional mas nao sei se correta
                  if (controller.endGame.cD <= 10) {
                    controller.endGame.cD = value;
                    if (controller.endGame.cD > 10) {
                      controller.endGame.cD -= 1;
                    }
                  }
                });
              },
            ),
            QuestionWidget(
              text: "Shipping Hub?",
              isPlussOrLess: false,
              width: 125,
              mainColor: widget.mainColor,
              index: controller.endGame.shippingH,
              name1: "Tripped",
              name2: "Balanced",
              secondaryColor: widget.secondaryColor,
              onPressedIndex: (index) {
                setState(() {
                  controller.endGame.shippingH = index;
                });
              },
            ),
            QuestionWidget(
              text: "Shared Hub?",
              width: 125,
              isPlussOrLess: false,
              mainColor: widget.mainColor,
              index: controller.endGame.sharedH,
              name1: "Balanced",
              name2: "Tripped",
              secondaryColor: widget.secondaryColor,
              onPressedIndex: (index) {
                setState(() {
                  controller.endGame.sharedH = index;
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
                        "Parking R1",
                        style: TextStyle(
                          fontSize: 25,
                          color: widget.secondaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      QuestionWidget(
                        isPlussOrLess: false,
                        mainColor: widget.mainColor,
                        name1: "None",
                        name2: "Partly",
                        name3: "Full",
                        index: controller.endGame.parked1,
                        useDivider: false,
                        secondaryColor: widget.secondaryColor,
                        onPressedIndex: (index) {
                          setState(() {
                            controller.endGame.parked1 = index;
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
                        "Parking R2",
                        style: TextStyle(
                          fontSize: 25,
                          color: widget.secondaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      QuestionWidget(
                        isPlussOrLess: false,
                        mainColor: widget.mainColor,
                        name1: "None",
                        name2: "Partly",
                        name3: "Full",
                        index: controller.endGame.parked2,
                        useDivider: false,
                        secondaryColor: widget.secondaryColor,
                        onPressedIndex: (index) {
                          setState(() {
                            controller.endGame.parked2 = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: widget.secondaryColor,
              thickness: 2,
            ),
            QuestionWidget(
              text: "Capping?",
              isPlussOrLess: false,
              mainColor: widget.mainColor,
              name1: "Zero",
              name2: "One",
              name3: "Two",
              index: controller.endGame.capping,
              secondaryColor: widget.secondaryColor,
              onPressedIndex: (index) {
                setState(() {
                  controller.endGame.capping = index;
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
              secondaryColor: widget.secondaryColor,
              nextColor: AppColors.black,
              backColor: AppColors.orange,
              onPressedBack: widget.onPressedBack,
              onPressedNext: widget.onPressedNext,
              nextText: "Finish",
              totalScore: controller.calcTotalScore(),
            )
          ],
        ),
      ),
    );
  }
}
