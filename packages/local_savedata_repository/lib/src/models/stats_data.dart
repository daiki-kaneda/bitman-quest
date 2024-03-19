class StatsData{
  StatsData({
    this.coinsCollected=0,
    this.enemysDefeated=0,
    this.jumpCount=0,
  });

  final int coinsCollected;
  final int enemysDefeated;
  final int jumpCount;

  StatsData copyWith({
    required int? coinsCollected,
    required int? enemysDefeated,
    required int? jumpCount,
    }){
      return StatsData(
        coinsCollected: coinsCollected ?? this.coinsCollected,
        enemysDefeated: enemysDefeated ?? this.enemysDefeated,
        jumpCount: jumpCount ?? this.jumpCount
      );
    }
  
  Map<String,dynamic> toJson(){
    return {
      'coinsCollected':coinsCollected,
      'enemysDefeated':enemysDefeated,
      'jumpCount':jumpCount
    };
  }

  factory StatsData.fromJson(Map<String,dynamic> json){
    return StatsData(
      coinsCollected: json['coinsCollected'],
      enemysDefeated: json['enemysDefeated'],
      jumpCount: json['jumpCount']
       );
  }
}