import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/start_page/widgets/start_button.dart';

class StartPage extends StatelessWidget {
  final void Function() onPressed;
  const StartPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "10091",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w500,
              ),
            ),
            StartButton(
              onPressed: onPressed,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Press the robot to ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "START!",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Image.asset("assets/boxer.gif"),
          ],
        ),
      ),
    );
  }
}
