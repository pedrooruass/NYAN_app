import 'package:flutter/material.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:provider/provider.dart';

import 'app/pages/my_app/my_app.dart';

void main(List<String> args) => runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => CalcScoreController()),
        ],
        child: const MyApp(),
      ),
    );
