import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:confetti/confetti.dart';

class WinConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;
  final Color teamColor;
  const WinConfettiWidget({
    Key? key,
    required this.confettiController,
    required this.teamColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        confettis(
          alignment: Alignment.topCenter,
          blastDirection: pi / 2,
        ),
        confettis(
          alignment: Alignment.centerLeft,
          blastDirection: 0,
        ),
        confettis(
          alignment: Alignment.centerRight,
          blastDirection: pi,
        ),
      ],
    );
  }

  Widget confettis({
    required AlignmentGeometry alignment,
    required double blastDirection,
  }) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: blastDirection,
        emissionFrequency: 0.75,
        minimumSize: const Size(10, 10),
        maximumSize: const Size(50, 50),
        numberOfParticles: 1,
        gravity: 0.1,
        colors: [
          teamColor,
          AppColors.orange,
          AppColors.yellowGenius,
        ],
      ),
    );
  }
}
