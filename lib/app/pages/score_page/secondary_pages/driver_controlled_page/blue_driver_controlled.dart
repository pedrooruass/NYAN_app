import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/bottom_line.dart';

class DriverControlled extends StatefulWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color allianceColor;
  final Color secondaryAllianceColor;
  final DriverControlledModel driverControlledModel;
  const DriverControlled(
      {Key? key,
      required this.mainColor,
      required this.secondaryColor,
      required this.allianceColor,
      required this.secondaryAllianceColor,
      required this.driverControlledModel})
      : super(key: key);

  @override
  State<DriverControlled> createState() => _DriverControlledState();
}

class _DriverControlledState extends State<DriverControlled> {
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
            const SizedBox(height: 10,),
            
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
            )
          ],
        ),
      ),
    );
  }
}
