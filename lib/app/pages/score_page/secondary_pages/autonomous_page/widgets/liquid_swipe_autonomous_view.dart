import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/blue_autonomous.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/red_autonomous.dart';

class LiquidSwipeAutonomousView extends StatefulWidget {
  const LiquidSwipeAutonomousView({
    Key? key,
  }) : super(key: key);

  @override
  State<LiquidSwipeAutonomousView> createState() => _LiquidSwipeAutonomousViewState();
}

class _LiquidSwipeAutonomousViewState extends State<LiquidSwipeAutonomousView> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: const [
        BlueAutonomous(),
        RedAutonomous(),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      slideIconWidget: Icon(
        Icons.arrow_back_ios,
        color: AppColors.white,
        size: 15,
      ),
      waveType: WaveType.circularReveal,
      positionSlideIcon: 0.8,
    );
  }
}
