class AutonomousModel {
  bool duckDelivered;
  int fstorage;

  AutonomousModel({this.duckDelivered = false, this.fstorage = 0});

  int calcDuckDelivered(){
    if(duckDelivered){
      //TODO ver pontos certo
      return 10;
    }
    return 0;
  }
  int calcFstorage(){
      //TODO ver pontos certo
    return fstorage * 3;
  }
}