import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/start_page/widgets/start_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            "10091",
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 35),
          const StartButton(),
          Image.asset("assets/boxer.gif"),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
