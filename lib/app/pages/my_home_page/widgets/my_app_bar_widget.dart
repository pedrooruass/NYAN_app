import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

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
              padding: const EdgeInsets.only(top: 14.5),
              child: ListTile(
                tileColor: Colors.transparent,
                leading: Image.asset(
                  "assets/Source Logo.png",
                ),
                trailing: IconButton(
                  icon:  Icon(FontAwesomeIcons.bars, color: AppColors.secondary,),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        );
}
