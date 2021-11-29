import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';

class CalcScoreController {
  AutonomousModel autonomous = AutonomousModel();
  DriverControlledModel driverControlled = DriverControlledModel();
  EndGameModel endGame = EndGameModel();

  int calcTotalScore() {
    int totalScore = 0;
    totalScore += autonomous.calcTotal();
    totalScore += driverControlled.calcTotal();
    totalScore += endGame.calcTotal();
    return totalScore;
  }
}