import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/widgets/confetti_widget.dart';
import 'package:provider/provider.dart';

class FinalScore extends StatefulWidget {
  const FinalScore({Key? key}) : super(key: key);

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  late CalcScoreController controller;
  late ConfettiController confettiController;

  @override
  void initState() {
    controller = Provider.of<CalcScoreController>(context, listen: false);
    confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Final Score Dashboard",
                  style: TextStyle(
                    fontSize: 33,
                    // color: AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: AppColors.primary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Blue Alliance",
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Autonomous:",
                                style: TextStyle(
                                  fontSize: 16.5,
                                  color: AppColors.yellowGenius,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.blueAutonomous
                                    .calcTotal()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Driver Controlled:",
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: AppColors.yellowGenius,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.blueDriverControlled
                                    .calcTotal()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "End Game:",
                                style: TextStyle(
                                  fontSize: 16.5,
                                  color: AppColors.yellowGenius,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.blueEndGame.calcTotal().toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.yellowGenius,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            controller.calcBlueTotalScore().toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AppColors.secondary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Red Alliance",
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Autonomous:",
                                style: TextStyle(
                                  fontSize: 16.5,
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.redAutonomous.calcTotal().toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Driver Controlled:",
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.redDriverControlled
                                    .calcTotal()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "End Game:",
                                style: TextStyle(
                                  fontSize: 16.5,
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.redEndGame.calcTotal().toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            controller.calcRedTotalScore().toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (controller.calcBlueTotalScore() >
                  controller.calcRedTotalScore())
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Blue Alliance",
                          style: TextStyle(
                            fontSize: 33,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " Won!!!",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.yellowGenius,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          confettiController.play();
                        });
                      },
                      child: Image.asset(
                        "assets/azul.png",
                        height: 200,
                      ),
                    ),
                  ],
                ),
              if (controller.calcRedTotalScore() >
                  controller.calcBlueTotalScore())
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Red Alliance",
                          style: TextStyle(
                            fontSize: 33,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " Won!!!",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          confettiController.play();
                        });
                      },
                      child: Image.asset(
                        "assets/verm.png",
                        height: 200,
                      ),
                    ),
                  ],
                ),

              if (controller.calcBlueTotalScore() ==
                  controller.calcRedTotalScore())
                Column(
                  children: [
                    Center(
                      child: Text(
                        "The match ended in a Draw!!!",
                        style: TextStyle(
                          fontSize: 27,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/duck.gif",
                      height: 200,
                    ),
                  ],
                ),
              // Put trofeu image or gif
            ],
          ),
          if (controller.calcBlueTotalScore() > controller.calcRedTotalScore())
            WinConfettiWidget(
              confettiController: confettiController,
              teamColor: AppColors.primary,
            ),
          if (controller.calcRedTotalScore() > controller.calcBlueTotalScore())
            WinConfettiWidget(
              confettiController: confettiController,
              teamColor: AppColors.secondary,
            ),
        ],
      ),
    );
  }
}
