import 'package:nyan_app/app/models/blue_autonomous_model.dart';
import 'package:nyan_app/app/models/blue_driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';
import 'package:nyan_app/app/models/red_autonomous_model.dart';
import 'package:nyan_app/app/models/red_driver_controlled_model.dart';
import 'package:nyan_app/app/models/red_end_game_model.dart';

class CalcScoreController {
  BlueAutonomousModel blueAutonomous = BlueAutonomousModel();
  RedAutonomousModel redAutonomous = RedAutonomousModel();
  BlueDriverControlledModel blueDriverControlled = BlueDriverControlledModel();
  RedDriverControlledModel redDriverControlled = RedDriverControlledModel();
  BlueEndGameModel blueEndGame = BlueEndGameModel();
  RedEndGameModel redEndGame = RedEndGameModel();

  int calcBlueTotalScore() {
    int totalScore = 0;
    totalScore += blueAutonomous.calcTotal();
    totalScore += blueDriverControlled.calcTotal();
    totalScore += blueEndGame.calcTotal();
    return totalScore;
  }
  int calcRedTotalScore() {
    int totalScore = 0;
    totalScore += redAutonomous.calcTotal();
    totalScore += redDriverControlled.calcTotal();
    totalScore += redEndGame.calcTotal();
    return totalScore;
  }
}
