class RedDriverControlledModel {
  int fstorage;
  int fhl1;
  int fhl2;
  int fhl3;
  int fshared;

  RedDriverControlledModel(
      {this.fstorage = 0,
      this.fhl1 = 0,
      this.fhl2 = 0,
      this.fhl3 = 0,
      this.fshared = 0});

  int calcFstorage() => fstorage * 1;
  int calcFhl1() => fhl1 * 2;
  int calcFhl2() => fhl2 * 4;
  int calcFhl3() => fhl3 * 6;
  int calcShared() => fshared * 4;
  int calcTotal(){
    return calcFstorage() + calcFhl1() + calcFhl2() + calcFhl3() + calcShared();
  }
  void resetPoints(){
    fstorage = 0;
    fhl1 = 0;
    fhl2 = 0;
    fhl3 = 0;
    fshared = 0;
  }
}
