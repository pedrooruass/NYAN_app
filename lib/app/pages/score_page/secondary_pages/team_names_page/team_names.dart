import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class TeamNames extends StatelessWidget {
  const TeamNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Team Names',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Team 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            Text(
              'Team 2',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: const [
        //     TextField(
        //       decoration: InputDecoration(
        //         hintText: 'Enter Team 1 Name',
        //         hintStyle: TextStyle(
        //           fontSize: 20,
        //           color: Colors.white,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ),
        //     TextField(
        //       decoration: InputDecoration(
        //         hintText: 'Enter Team 2 Name',
        //         hintStyle: TextStyle(
        //           fontSize: 20,
        //           color: Colors.white,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
