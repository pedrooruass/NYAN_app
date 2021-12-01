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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: AppColors.primary,
          //   ),
          //   child: Column(
          //     children: [
          //       Text(
          //         "Blue Alliance",
          //         style: TextStyle(
          //           fontSize: 33,
          //           color: AppColors.white,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Row(
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   Text(
          //                     "Autonomous:",
          //                     style: TextStyle(
          //                       fontSize: 23,
          //                       color: AppColors.white,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 10),
          //                   Text(
          //                     controller.autonomous.calcTotal().toString(),
          //                     style: TextStyle(
          //                       fontSize: 25,
          //                       color: AppColors.yellowGenius,
          //                       fontWeight: FontWeight.w300,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "Driver Controlled:",
          //                     style: TextStyle(
          //                       fontSize: 20,
          //                       color: AppColors.white,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 10),
          //                   Text(
          //                     controller.autonomous.calcTotal().toString(),
          //                     style: TextStyle(
          //                       fontSize: 25,
          //                       color: AppColors.yellowGenius,
          //                       fontWeight: FontWeight.w300,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "End Game:",
          //                     style: TextStyle(
          //                       fontSize: 23,
          //                       color: AppColors.white,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 10),
          //                   Text(
          //                     controller.autonomous.calcTotal().toString(),
          //                     style: TextStyle(
          //                       fontSize: 25,
          //                       color: AppColors.yellowGenius,
          //                       fontWeight: FontWeight.w300,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           const SizedBox(width: 70),
          //           Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   "Total:",
          //                   style: TextStyle(
          //                     fontSize: 30,
          //                     color: AppColors.yellowGenius,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //                 Text(
          //                   controller.autonomous.calcTotal().toString(),
          //                   style: TextStyle(
          //                     fontSize: 30,
          //                     color: AppColors.white,
          //                     fontWeight: FontWeight.w300,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 20),
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
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.orange,
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
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.orange,
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
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Blue Alliance won",
              style: TextStyle(
                fontSize: 33,
                color: AppColors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Put trofeu image or gif
          Image.asset("assets/316-3160146_hand-with-trophy-icon-clipart.png"),
        ],
      ),
    );
  }
}
