import 'package:flutter/material.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:provider/provider.dart';

class FinalScore extends StatefulWidget {
  const FinalScore({Key? key}) : super(key: key);

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  late CalcScoreController controller;

  @override
  void initState() {
    controller = Provider.of<CalcScoreController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Column(
            children: [
              Text(
                "Blue Alliance",
                style: TextStyle(
                  fontSize: 33,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Autonomous:",
                            style: TextStyle(
                              fontSize: 23,
                              color: AppColors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            controller.autonomous.calcTotal().toString(),
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Driver Controlled:",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            controller.autonomous.calcTotal().toString(),
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "End Game:",
                            style: TextStyle(
                              fontSize: 23,
                              color: AppColors.purple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            controller.autonomous.calcTotal().toString(),
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 70),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.purple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          controller.autonomous.calcTotal().toString(),
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary,
          ),
          child: Column(
            children: [
              Text(
                "Red Alliance",
                style: TextStyle(
                  fontSize: 33,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Autonomous:",
                        style: TextStyle(
                          fontSize: 23,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.autonomous.calcTotal().toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Driver Controlled:",
                        style: TextStyle(
                          fontSize: 23,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.autonomous.calcTotal().toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "End Game:",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      controller.autonomous.calcTotal().toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
