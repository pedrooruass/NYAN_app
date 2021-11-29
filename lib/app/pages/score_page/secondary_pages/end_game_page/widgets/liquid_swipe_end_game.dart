import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/end_game_page/end_game.dart';

class LiquidSwipeEndGameView extends StatefulWidget {
  final void Function() onPressedBack;
  const LiquidSwipeEndGameView({
    Key? key,
    required this.onPressedBack,
  }) : super(key: key);

  @override
  State<LiquidSwipeEndGameView> createState() =>
      _LiquidSwipeEndGameViewState();
}

class _LiquidSwipeEndGameViewState
    extends State<LiquidSwipeEndGameView> {
  DriverControlledModel blueDriverControlledModel = DriverControlledModel();
  DriverControlledModel redDriverControlledModel = DriverControlledModel();

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [
        EndGame(
          key: const Key('DriverControlledBlue'),
          mainColor: AppColors.purple,
          secondaryColor: AppColors.white,
          allianceColor: AppColors.primary,
          secondaryAllianceColor: AppColors.secondary,
          driverControlledModel: blueDriverControlledModel,
          onPressedBack: widget.onPressedBack,
        ),
        EndGame(
          key: const Key('DriverControlledRed'),
          mainColor: AppColors.white,
          secondaryColor: AppColors.black,
          allianceColor: AppColors.secondary,
          secondaryAllianceColor: AppColors.primary,
          driverControlledModel: redDriverControlledModel,
          onPressedBack: widget.onPressedBack,
        ),
      ],
      enableLoop: true,
      fullTransitionValue: 880,
      waveType: WaveType.circularReveal,
    );
  }
}
