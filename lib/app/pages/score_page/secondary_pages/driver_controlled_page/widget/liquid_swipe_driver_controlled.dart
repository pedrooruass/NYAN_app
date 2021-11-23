import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/blue_driver_controlled.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/red_driver_controlled.dart';

class LiquidSwipeDriverControlledView extends StatefulWidget {
  const LiquidSwipeDriverControlledView({
    Key? key,
  }) : super(key: key);

  @override
  State<LiquidSwipeDriverControlledView> createState() => _LiquidSwipeDriverControlledViewState();
}

class _LiquidSwipeDriverControlledViewState extends State<LiquidSwipeDriverControlledView> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: const [
        BlueDriverControlled(),
        RedDriverControlled(),
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
