import 'package:auto_size_text/auto_size_text.dart';
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
            AutoSizeText(
              widget.isBlue ? "Blue Alliance" : "Red Alliance",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.3,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Autonomous:",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                Obx(
                  () {
                    return AutoSizeText(
                      widget.isBlue
                          ? controller.blueAutonomous.value
                              .calcTotal()
                              .toString()
                          : controller.redAutonomous.value
                              .calcTotal()
                              .toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Driver Controlled:",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.041,
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                Obx(
                  () {
                    return AutoSizeText(
                      widget.isBlue
                          ? controller.blueDriverControlled.value
                              .calcTotal()
                              .toString()
                          : controller.redDriverControlled.value
                              .calcTotal()
                              .toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "End Game:",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: widget.isBlue
                        ? AppColors.yellowGenius
                        : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                Obx(
                  () {
                    return AutoSizeText(
                      widget.isBlue
                          ? controller.blueEndGame.value.calcTotal().toString()
                          : controller.redEndGame.value.calcTotal().toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                    );
                  },
                ),
              ],
            ),
            AutoSizeText(
              "Total:",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.09,
                color:
                    widget.isBlue ? AppColors.yellowGenius : AppColors.orange,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
            ),
            Obx(
              () {
                return AutoSizeText(
                  widget.isBlue
                      ? controller.calcBlueTotalScore().toString()
                      : controller.calcRedTotalScore().toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.09,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
