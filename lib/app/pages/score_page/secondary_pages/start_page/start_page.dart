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
            const SizedBox(height: 50),
            const Text(
              "10091",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 35),
            StartButton(
              onPressed: onPressed,
            ),
            Image.asset("assets/boxer.gif"),
          ],
        ),
      ),
    );
  }
}
