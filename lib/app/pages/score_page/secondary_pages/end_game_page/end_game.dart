import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/question_widget.dart';

class EndGame extends StatefulWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final DriverControlledModel driverControlledModel;
  final void Function() onPressedBack;
  const EndGame(
      {Key? key,
      required this.mainColor,
      required this.secondaryColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.driverControlledModel,
      required this.onPressedBack})
      : super(key: key);

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
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
                        // QuestionWidget.resetPoints();
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
              onPressedPlusLess: (value) {
                setState(() {
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
              nextColor: AppColors.red,
              backColor: AppColors.orange,
              onPressedBack: widget.onPressedBack,
            )
          ],
        ),
      ),
    );
  }
}
