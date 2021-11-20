import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class MyAppBarWidget extends PreferredSize {
  final void Function() onPressed;
  MyAppBarWidget({
    Key? key,
    required BuildContext context,
    required double height,
    required this.onPressed,
  }) : super(
          key: key,
          preferredSize: Size.fromHeight(
            height,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 9.5),
              child: ListTile(
                tileColor: Colors.transparent,
                leading:
                    // const Text(
                    //   "10091",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 35,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Image.asset(
                  "assets/BRANCO.png",
                ),
                trailing: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    color: AppColors.white,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        );
}
