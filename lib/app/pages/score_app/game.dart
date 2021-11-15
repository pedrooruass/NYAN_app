import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  // NOT STARTED YET, probably a lot to fix and do here!!!

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 50,),
          // Image.asset("assets/Source Logo.png"),
          const SizedBox(height: 100,),
          const Text(
                      "10091",
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
          const SizedBox(height: 35,),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.secondary,
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
              height: 50,
              width: 200,
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Image.asset("assets/ghost.gif")
          Image.asset("assets/boxer.gif"),
          const SizedBox(height: 15,),

        ],
      ),
    );
  }
}
