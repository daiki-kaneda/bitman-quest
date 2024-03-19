import 'package:flame/game.dart';

//永続化の必要がないが、複数のページで共有したいデータのクラス（ルートのゲームクラスで扱う）
class GameState{
  GameState({this.stageSelected=1,this.timeSpeed=1});

  final int stageSelected; 

  final double timeSpeed; //timeSpeed of PlayingRoute

  GameState copyWith({
    int? stageSelected,
    double? timeSpeed
  }){
    return GameState(
      stageSelected: stageSelected ?? this.stageSelected,
      timeSpeed: timeSpeed ?? this.timeSpeed
    );
  }
}