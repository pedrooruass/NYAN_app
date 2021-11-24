import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';

class Autonomous extends StatefulWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final AutonomousModel autonomousModel;
  final void Function() onPressed;
  const Autonomous(
      {Key? key,
      required this.mainColor,
      required this.secondaryColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.autonomousModel,
      required this.onPressed})
      : super(key: key);

  @override
  State<Autonomous> createState() => _AutonomousState();
}

class _AutonomousState extends State<Autonomous> {
  @override
  void initState() {
    super.initState();
    print("init state");
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
                      color: widget.mainColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 15),
                BouncingWidget(
                  child: Icon(
                    FontAwesomeIcons.redo,
                    color: widget.secondaryColor,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      // QuestionWidget.resetPoints();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            QuestionWidget(
              question: "Duck Delivered?",
              isTrueOrFalse: true,
              mainColor: widget.mainColor,
              secondaryColor: widget.secondaryColor,
              points: widget.autonomousModel.fstorage,
              onPressedPlusLess: (value) {},
            ),
            QuestionWidget(
              question: "Freight in Storage?",
              mainColor: widget.mainColor,
              secondaryColor: widget.secondaryColor,
              points: widget.autonomousModel.fstorage,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.autonomousModel.fstorage = value;
                });
              },
            ),
            QuestionWidget(
              question: "Freight in Hub?",
              mainColor: widget.mainColor,
              secondaryColor: widget.secondaryColor,
              points: widget.autonomousModel.fhub,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.autonomousModel.fhub = value;
                });
              },
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Where the Robots are Parked?",
                    style: TextStyle(
                      fontSize: 25,
                      color: widget.mainColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                QuestionWidget(
                  question: "Storage Unit?",
                  useDivider: false,
                  mainColor: widget.mainColor,
                  secondaryColor: widget.secondaryColor,
                  points: widget.autonomousModel.psu,
                  onPressedPlusLess: (value) {
                    setState(() {
                      widget.autonomousModel.psu = value;
                    });
                  },
                ),
                QuestionWidget(
                  question: "Completely?",
                  useDivider: false,
                  mainColor: widget.mainColor,
                  secondaryColor: widget.secondaryColor,
                  isTrueOrFalse: true,
                  points: widget.autonomousModel.psu,
                  sizeQuestionText: 20,
                  onPressedPlusLess: (value) {
                    setState(() {
                      widget.autonomousModel.psu = value;
                    });
                  },
                ),
                QuestionWidget(
                  question: "Warehouse?",
                  mainColor: widget.mainColor,
                  secondaryColor: widget.secondaryColor,
                  points: widget.autonomousModel.pw,
                  useDivider: false,
                  onPressedPlusLess: (value) {
                    setState(() {
                      widget.autonomousModel.pw = value;
                    });
                  },
                ),
                QuestionWidget(
                  question: "Completely?",
                  mainColor: widget.mainColor,
                  secondaryColor: widget.secondaryColor,
                  isTrueOrFalse: true,
                  points: widget.autonomousModel.psu,
                  sizeQuestionText: 20,
                  onPressedPlusLess: (value) {
                    setState(() {
                      widget.autonomousModel.psu = value;
                    });
                  },
                ),
              ],
            ),
            QuestionWidget(
              question: "Freight Bonus?",
              isBonus: true,
              mainColor: widget.mainColor,
              secondaryColor: widget.secondaryColor,
              points: widget.autonomousModel.fstorage,
              onPressedPlusLess: (value) {
                setState(() {
                  widget.autonomousModel.fstorage = value;
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
              nextColor: AppColors.orange,
              onPressed: widget.onPressed,
            )
          ],
        ),
      ),
    );
  }
}
