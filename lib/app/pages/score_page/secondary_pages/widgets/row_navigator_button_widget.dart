import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class RowNavigatorWidget extends StatelessWidget {
  final void Function(int) onTap;
  final int indexSelected;
  final String name1;
  final String name2;
  final String? name3;
  final String? name4;
  final String? name5;
  final Color mainColor;
  final Color secondaryColor;

  const RowNavigatorWidget({
    Key? key,
    required this.onTap,
    required this.indexSelected,
    required this.name1,
    required this.name2,
    required this.mainColor,
    required this.secondaryColor,
    this.name3,
    this.name4,
    this.name5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            width: 120,
            height: 25,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInkWell(text: name1, index: 0),
                buildInkWell(text: name2, index: 1),
                if(name3 != null) buildInkWell(text: name3!, index: 2),
                if(name4 != null) buildInkWell(text: name4!, index: 3),
                if(name5 != null) buildInkWell(text: name5!, index: 4),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInkWell({String text = "Text", required int index}) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          alignment: Alignment.center,
          height: 30,
          decoration: BoxDecoration(
            color: indexSelected == index
                ? secondaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: indexSelected == index ? mainColor : secondaryColor,
              fontWeight:
                  indexSelected == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
