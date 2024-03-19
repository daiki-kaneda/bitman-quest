
//ゲームプレイ中にのみ必要なデータ（体力、持ち物、コインなど）

enum Equipment{
  sword,gun,helmet
}

enum BitmanStatus{
  normal,speedUp,speedDown,powerUp,powerDown
}

class PlayingState{
  PlayingState({
    this.lives=6,
    this.iventory=const [],
    this.coinsCollected = 0,
    this.sapphireCollected =0,
    this.status = BitmanStatus.normal,
    this.objectSpeed=0
  });

  int lives;
  List<Equipment> iventory;
  int coinsCollected;
  int sapphireCollected;
  BitmanStatus status;
  double objectSpeed;

  bool timeUp = false;
  bool fallDown = false;
  bool isGameover = false;
}