import 'package:auto_size_text/auto_size_text.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class NameRowWidget extends StatelessWidget {
  final void Function() onPressed;
  final Color mainColor;
  final String text;
  const NameRowWidget({
    Key? key,
    required this.onPressed,
    required this.mainColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: AppColors.white),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: BouncingWidget(
            child: Icon(
              FontAwesomeIcons.redo,
              color: mainColor,
              size: MediaQuery.of(context).size.width * 0.05,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
