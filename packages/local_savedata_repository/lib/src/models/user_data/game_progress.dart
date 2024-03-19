
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';


part 'game_progress.g.dart';

@JsonSerializable()
class GameProgress{
  GameProgress({this.stages = const []});

  List<Stage> stages;

  void update(int stageIndex,{bool? isCleared,int? score}){
    final index =stages.indexWhere((stage) =>
    stage.stageIndex == stageIndex);
    if(index<0) return;

    stages[index] = stages[index].copyWith(
      isCleared: isCleared,
      score: score
    );
  }

  Map<String,dynamic> toJson()=>_$GameProgressToJson(this);

  factory GameProgress.fromJson(Map<String,dynamic> json)
  =>_$GameProgressFromJson(json);

  //最後にクリアしたステージのインデックスを返す
  int lastClearedStage(){
    //はじめは０を返す
    if(stages
    .where((stage) => stage.isCleared).toList().isEmpty) return 0;

    return stages
    .where((stage) => stage.isCleared)
    .map((stage) => stage.stageIndex)
    .reduce(max);
  }

}


class Stage{
  Stage({
    required this.worldIndex,
    required this.stageIndex,
    this.isCleared = false,
    this.score = 0
  });
  final int worldIndex;
  final int stageIndex;

  bool isCleared;
  int score;

  Stage copyWith({
    int? worldIndex,
    int? stageIndex,
    bool? isCleared,
    int? score
  }){
    return Stage(
      worldIndex: worldIndex ?? this.worldIndex,
       stageIndex: stageIndex ?? this.stageIndex,
       isCleared: isCleared ?? this.isCleared,
       score:  score ?? this.score,
       );
  }

  Map<String,dynamic> toJson(){
    return {
      'worldIndex':worldIndex,
      'stageIndex':stageIndex,
      'isCleared':isCleared,
      'score':score,
    };
  }

  factory Stage.fromJson(Map<String,dynamic> json){
    return Stage(
      worldIndex: json['worldIndex'] as int,
      stageIndex: json['stageIndex'] as int,
      isCleared: json['isCleared'] as bool,
      score: json['score'] as int
      );
  }

}