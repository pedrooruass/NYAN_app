import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/autonomous_1.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/autonomous_2.dart';

class LiquidSwipeView extends StatefulWidget {
  const LiquidSwipeView({
    Key? key,
  }) : super(key: key);

  @override
  State<LiquidSwipeView> createState() => _LiquidSwipeViewState();
}

class _LiquidSwipeViewState extends State<LiquidSwipeView> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: const [
        Autonomous1(),
        Autonomous2(),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      slideIconWidget: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white
      ),
      waveType: WaveType.circularReveal,
      positionSlideIcon: 0.87,
    );
  }
}
