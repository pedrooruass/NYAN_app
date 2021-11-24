import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/blue_driver_controlled.dart';

class LiquidSwipeDriverControlledView extends StatefulWidget {
  final void Function() onPressed;
  const LiquidSwipeDriverControlledView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LiquidSwipeDriverControlledView> createState() =>
      _LiquidSwipeDriverControlledViewState();
}

class _LiquidSwipeDriverControlledViewState
    extends State<LiquidSwipeDriverControlledView> {
  DriverControlledModel blueDriverControlledModel = DriverControlledModel();
  DriverControlledModel redDriverControlledModel = DriverControlledModel();

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        DriverControlled(
          key: const Key('DriverControlledBlue'),
          mainColor: AppColors.orange,
          secondaryColor: AppColors.white,
          allianceColor: AppColors.primary,
          secondaryAllianceColor: AppColors.secondary,
          driverControlledModel: blueDriverControlledModel,
          onPressed: widget.onPressed,
        ),
        DriverControlled(
          key: const Key('DriverControlledRed'),
          mainColor: AppColors.white,
          secondaryColor: AppColors.black,
          allianceColor: AppColors.secondary,
          secondaryAllianceColor: AppColors.primary,
          driverControlledModel: redDriverControlledModel,
          onPressed: widget.onPressed,
        ),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      slideIconWidget: Icon(
        Icons.arrow_back_ios,
        color: AppColors.white,
        size: 13,
      ),
      waveType: WaveType.circularReveal,
      positionSlideIcon: 0.05,
    );
  }
}
