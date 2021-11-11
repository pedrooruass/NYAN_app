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
            child: ListTile(
              tileColor: Colors.transparent,
              leading: Image.asset(
                "assets/Source Logo.png",
                fit: BoxFit.contain,
                height: 300,
              ),
              title: Text(
                'My App Bar',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          );
}
