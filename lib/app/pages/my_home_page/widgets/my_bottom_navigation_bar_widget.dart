import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MyBottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onChanged;
  const MyBottomNavigationBarWidget(
      {Key? key, required this.selectedIndex, required this.onChanged})
      : super(key: key);

  @override
  State<MyBottomNavigationBarWidget> createState() =>
      _MyBottomNavigationBarWidgetState();
}

class _MyBottomNavigationBarWidgetState
    extends State<MyBottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar.colorful(
      backgroundColor: AppColors.white,
      onButtonPressed: widget.onChanged,
      iconSize: 25,
      selectedIndex: widget.selectedIndex,
      barItems: [
        BarItem(
          icon: FontAwesomeIcons.info,
          title: 'Rules',
          activeColor: AppColors.secondary,
          inactiveColor: AppColors.primary,
        ),
        BarItem(
          icon: FontAwesomeIcons.robot,
          title: 'Score',
          activeColor: AppColors.secondary,
          inactiveColor: AppColors.primary,
        ),
      ],
    );
  }
}
