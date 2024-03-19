import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/objects/problem/spawn_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';



enum SpawnsStatus{
  horizontal,vertical,rectangle
}
class Spawns extends PositionComponent{
  Spawns({required this.status,required this.gridPoints,this.eraces = const []});

  final List<Vector2> gridPoints;
  final SpawnsStatus status;

  final List<Vector2> eraces;
  
  @override
  FutureOr<void> onLoad() {
    //gridPointsの初めの点は原点、次の点が幅や高さを表す
    if(gridPoints.length==2){
      switch(status){
        case SpawnsStatus.horizontal:{
          for(double i=0;i<gridPoints[1].x;i++){
          add(SpawnBlock(gridPoints[0].x +i, gridPoints[0].y));
          }
        }
        case SpawnsStatus.vertical:{
          for(double j=0;j<gridPoints[1].y;j++){
          add(SpawnBlock(gridPoints[0].x , gridPoints[0].y +j));
          }
        }
        case SpawnsStatus.rectangle:{
          for(double i=0;i<gridPoints[1].x;i++){
          add(SpawnBlock(gridPoints[0].x +i, gridPoints[0].y));
          add(SpawnBlock(gridPoints[0].x +i, gridPoints[0].y + gridPoints[1].y -1));
          }
          for(double j=0;j<gridPoints[1].y-2;j++){
          add(SpawnBlock(gridPoints[0].x , gridPoints[0].y+1 +j));
          add(SpawnBlock(gridPoints[0].x + gridPoints[1].x-1 , gridPoints[0].y+1 +j));
          }
        }
      }
      }
      removeAll(children.whereType<StageObject>().where((s) => 
      eraces.contains(s.gridPosition) ).toList());
    return super.onLoad();
  }

}