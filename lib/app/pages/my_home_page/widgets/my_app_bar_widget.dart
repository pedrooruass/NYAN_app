import 'package:flutter/material.dart';

class MyAppBarWidget extends PreferredSize {
  MyAppBarWidget(
      {Key? key, required BuildContext context, required double height})
      : super(
          key: key,
          preferredSize: Size.fromHeight(
            height,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListTile(
                tileColor: Colors.transparent,
                leading: Image.asset(
                  "assets/Source Logo.png",
                ),
                trailing: GestureDetector(
                  child: Image.asset(
                    "assets/robot.png",
                  ),
                ),
              ),
            ),
          ),
        );
}
