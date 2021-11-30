import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/autonomous.dart';

class LiquidSwipeAutonomousView extends StatefulWidget {
  final void Function() onPressed;
  const LiquidSwipeAutonomousView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LiquidSwipeAutonomousView> createState() =>
      _LiquidSwipeAutonomousViewState();
}

class _LiquidSwipeAutonomousViewState extends State<LiquidSwipeAutonomousView> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        Autonomous(
          key: const Key('AutonomousBlue'),
          mainColor: AppColors.yellowGenius,
          allianceColor: AppColors.primary,
          secondaryAllianceColor: AppColors.secondary,
          onPressed: widget.onPressed,
        ),
        Autonomous(
          key: const Key('AutonomousRed'),
          mainColor: AppColors.orange,
          allianceColor: AppColors.secondary,
          secondaryAllianceColor: AppColors.primary,
          onPressed: widget.onPressed,
        ),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      waveType: WaveType.circularReveal,
    );
  }
}
