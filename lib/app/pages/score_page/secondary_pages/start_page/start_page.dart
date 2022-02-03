import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
             AutoSizeText(
              "10091",
              style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.17,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
            ),
            StartButton(
              onPressed: onPressed,
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 AutoSizeText(
                  "Press the robot to ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "START!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
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
