import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/widgets/confetti_trigger_widget.dart';

class AllianceWinnerWidget extends StatefulWidget {
  final ConfettiController confettiController;
  final bool isBlue;
  const AllianceWinnerWidget(
      {Key? key, required this.confettiController, required this.isBlue})
      : super(key: key);

  @override
  State<AllianceWinnerWidget> createState() => _AllianceWinnerWidgetState();
}

class _AllianceWinnerWidgetState extends State<AllianceWinnerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              widget.isBlue ? "Blue Alliance" : "Red Alliance",
              style: TextStyle(
                fontSize: 33,
                color: widget.isBlue ? AppColors.primary : AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            AutoSizeText(
              " Won!!!",
              style: TextStyle(
                fontSize: 35,
                color:
                    widget.isBlue ? AppColors.yellowGenius : AppColors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ConfettiTriggerWidget(
            confettiController: widget.confettiController,
            isBlue: widget.isBlue),
      ],
    );
  }
}
