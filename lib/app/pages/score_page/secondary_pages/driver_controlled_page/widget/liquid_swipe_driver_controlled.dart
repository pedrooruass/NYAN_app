import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/driver_controlled.dart';

class LiquidSwipeDriverControlledView extends StatefulWidget {
  final void Function() onPressedNext;
  final void Function() onPressedBack;
  const LiquidSwipeDriverControlledView({
    Key? key,
    required this.onPressedNext,
    required this.onPressedBack,
  }) : super(key: key);

  @override
  State<LiquidSwipeDriverControlledView> createState() =>
      _LiquidSwipeDriverControlledViewState();
}

class _LiquidSwipeDriverControlledViewState
    extends State<LiquidSwipeDriverControlledView> {

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        DriverControlled(
          key: const Key('DriverControlledBlue'),
          mainColor: AppColors.yellowGenius,
          allianceColor: AppColors.primary,
          secondaryAllianceColor: AppColors.secondary,
          onPressedNext: widget.onPressedNext,
          onPressedBack: widget.onPressedBack,
        ),
        DriverControlled(
          key: const Key('DriverControlledRed'),
          mainColor: AppColors.orange,
          allianceColor: AppColors.secondary,
          secondaryAllianceColor: AppColors.primary,
          onPressedNext: widget.onPressedNext,
          onPressedBack: widget.onPressedBack,
        ),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      waveType: WaveType.circularReveal,
    );
  }
}
