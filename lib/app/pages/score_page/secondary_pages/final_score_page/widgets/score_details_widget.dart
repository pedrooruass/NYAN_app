import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class ScoreDetailsWidget extends StatefulWidget {
  final bool isBlue;
  const ScoreDetailsWidget({Key? key, required this.isBlue}) : super(key: key);

  @override
  State<ScoreDetailsWidget> createState() => _ScoreDetailsWidgetState();
}

class _ScoreDetailsWidgetState extends State<ScoreDetailsWidget> {
  CalcScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: widget.isBlue
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
          color: widget.isBlue ? AppColors.primary : AppColors.secondary,
        ),
        child: Column(
          children: [
            Text(
              widget.isBlue ? "Blue Alliance" : "Red Alliance",
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
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () {
                    return Text(
                      widget.isBlue
                          ? controller.blueAutonomous.value
                              .calcTotal()
                              .toString()
                          : controller.redAutonomous.value
                              .calcTotal()
                              .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    );
                  },
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
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () {
                    return Text(
                      widget.isBlue
                          ? controller.blueDriverControlled.value
                              .calcTotal()
                              .toString()
                          : controller.redDriverControlled.value
                              .calcTotal()
                              .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    );
                  },
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
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () {
                    return Text(
                      widget.isBlue
                          ? controller.blueEndGame.value.calcTotal().toString()
                          : controller.redEndGame.value.calcTotal().toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    );
                  },
                ),
              ],
            ),
            Text(
              "Total:",
              style: TextStyle(
                fontSize: 30,
                color:
                    widget.isBlue ? AppColors.yellowGenius : AppColors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            Obx(
              () {
                return Text(
                  widget.isBlue
                      ? controller.calcBlueTotalScore().toString()
                      : controller.calcRedTotalScore().toString(),
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
