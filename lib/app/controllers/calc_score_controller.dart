import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';
import 'package:nyan_app/app/models/red_autonomous_model.dart';

class CalcScoreController {
  AutonomousModel autonomous = AutonomousModel();
  RedAutonomousModel redAutonomous = RedAutonomousModel();
  DriverControlledModel driverControlled = DriverControlledModel();
  EndGameModel endGame = EndGameModel();

  int calcBlueTotalScore() {
    int totalScore = 0;
    totalScore += autonomous.calcTotal();
    totalScore += driverControlled.calcTotal();
    totalScore += endGame.calcTotal();
    return totalScore;
  }
  int calcRedTotalScore() {
    int totalScore = 0;
    totalScore += redAutonomous.calcTotal();
    //implementar os outros
    return totalScore;
  }
}
