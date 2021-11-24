import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/autonomous.dart';

class LiquidSwipeAutonomousView extends StatefulWidget {
  const LiquidSwipeAutonomousView({
    Key? key,
  }) : super(key: key);

  @override
  State<LiquidSwipeAutonomousView> createState() =>
      _LiquidSwipeAutonomousViewState();
}

class _LiquidSwipeAutonomousViewState extends State<LiquidSwipeAutonomousView> {

  AutonomousModel blueAutonomousModel = AutonomousModel();
  AutonomousModel redAutonomousModel = AutonomousModel();

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        Autonomous(
          key: const Key('AutonomousBlue'),
          mainColor: AppColors.green,
          secondaryColor: AppColors.white,
          allianceColor: AppColors.primary,
          secondaryAllianceColor: AppColors.secondary,
          autonomousModel: blueAutonomousModel,
        ),
        Autonomous(
          key: const Key('AutonomousRed'),
          mainColor: AppColors.white,
          secondaryColor: AppColors.black,
          allianceColor: AppColors.secondary,
          secondaryAllianceColor: AppColors.primary,
          autonomousModel: redAutonomousModel,
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
