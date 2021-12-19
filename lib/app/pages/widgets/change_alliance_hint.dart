import 'package:flutter/material.dart';

class ChangeAllianceHintWidget extends StatelessWidget {
  final Color mainColor;
  final Color secondaryAllianceColor;
  const ChangeAllianceHintWidget({
    Key? key,
    required this.mainColor,
    required this.secondaryAllianceColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Swipe left to change alliance",
          style: TextStyle(
            color: secondaryAllianceColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
