import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:confetti/confetti.dart';

class WinConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;
  final Color teamColor;
  const WinConfettiWidget(
      {Key? key,
      required this.confettiController,
      required this.teamColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirection: pi/2,
            emissionFrequency: 0.75,
            minimumSize: const Size(10, 10),
            maximumSize: const Size(50, 50),
            numberOfParticles: 1,
            gravity: 0.1,
            colors: [teamColor, AppColors.orange, AppColors.yellowGenius,],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirection: 0,
            emissionFrequency: 0.75,
            minimumSize: const Size(10, 10),
            maximumSize: const Size(50, 50),
            numberOfParticles: 1,
            gravity: 0.1,
            colors: [teamColor, AppColors.orange, AppColors.yellowGenius,],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirection: pi,
            emissionFrequency: 0.75,
            minimumSize: const Size(10, 10),
            maximumSize: const Size(50, 50),
            numberOfParticles: 1,
            gravity: 0.1,
            colors: [teamColor, AppColors.orange, AppColors.yellowGenius,],
          ),
        ),
      ],
    );
  }
}
