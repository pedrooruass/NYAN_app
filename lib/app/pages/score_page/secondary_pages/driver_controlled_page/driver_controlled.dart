import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';
import 'package:provider/provider.dart';

class DriverControlled extends StatefulWidget {
  final Color mainColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final void Function() onPressedNext;
  final void Function() onPressedBack;
  const DriverControlled(
      {Key? key,
      required this.mainColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.onPressedNext,
      required this.onPressedBack})
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Driver Controlled',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 18),
                  child: BouncingWidget(
                    child: Icon(
                      FontAwesomeIcons.redo,
                      color: widget.mainColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.driverControlled.resetPoints();
                      });
                    },
                  ),
                ),
              ],
            ),
           const Spacer(),
            // const SizedBox(
            //   height: 10,
            // ),
            QuestionWidget(
              text: "Freight in Storage?",
              points: controller.driverControlled.fstorage,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.driverControlled.fstorage = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L1",
              points: controller.driverControlled.fhl1,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.driverControlled.fhl1 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L2",
              points: controller.driverControlled.fhl2,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.driverControlled.fhl2 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Hub L3",
              points: controller.driverControlled.fhl3,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.driverControlled.fhl3 = value;
                });
              },
            ),
            QuestionWidget(
              text: "Freight in Shared",
              points: controller.driverControlled.fshared,
              mainColor: widget.mainColor,
              onPressedPlusLess: (value) {
                setState(() {
                  controller.driverControlled.fshared = value;
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
              backColor: AppColors.orange,
              onPressedNext: widget.onPressedNext,
              onPressedBack: widget.onPressedBack,
              totalScore: controller.calcTotalScore(),
            )
          ],
        ),
      ),
    );
  }
}
