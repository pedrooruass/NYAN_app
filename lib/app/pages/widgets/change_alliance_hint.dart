import 'package:auto_size_text/auto_size_text.dart';
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
        child: AutoSizeText(
          "Swipe left to change alliance",
          style: TextStyle(
            color: secondaryAllianceColor,
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
