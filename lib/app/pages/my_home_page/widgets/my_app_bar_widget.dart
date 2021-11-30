import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class MyAppBarWidget extends PreferredSize {
  final void Function() onPressed1;
  final void Function() onPressed2;
  MyAppBarWidget({
    Key? key,
    required BuildContext context,
    required double height,
    required this.onPressed1,
    required this.onPressed2,
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
                leading: BouncingWidget(
                  onPressed: onPressed1,
                  child: Image.asset(
                    "assets/o_brabo.png",
                  ),
                ),
                trailing: BouncingWidget(
                  onPressed: onPressed2,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    size: 25,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
}
