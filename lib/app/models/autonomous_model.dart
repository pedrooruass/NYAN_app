class AutonomousModel {
  bool duckDelivered;
  int fstorage;
  int fhub;
  int psu;
  bool psuc;
  int pw;
  bool pwc;
  bool bnone;
  bool bduck;
  bool bteam;

  AutonomousModel({
    this.duckDelivered = false,
    this.fstorage = 0,
    this.fhub = 0,
    this.psu = 0,
    this.psuc = false,
    this.pw = 0,
    this.pwc = false,
    this.bnone = false,
    this.bduck = false,
    this.bteam = false,
  });

  int calcDuckDelivered() {
    if (duckDelivered) {
      //TODO ver pontos certo
      return 10;
    }
    return 0;
  }

  int calcFstorage() => fstorage * 3;


  int calcFhub() => fhub * 3;

  int calcPsu() {
    if (psuc) {
      return psu * 6;
    } else {
      return psu * 3;
    }
  }
  int calcPw() {
    if (pwc) {
      return pw * 6;
    } else {
      return pw * 3;
    }
  }
//TODO ver como resetar
void resetPoints(){
  duckDelivered = false;
  fstorage = 0;
  fhub = 0;
  psu = 0;
  psuc = false;
  pw = 0;
  pwc = false;
  
}
//TODO 1- ver oq fazer com os bools, 2- Colocar a contagem de pontos certa, 3- Fazer methodo reset && total
}
