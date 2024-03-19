import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/grounds.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/locked_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';



enum LockedsStatus{
  horizontal,vertical,rectangle
}
class Lockeds extends PositionComponent{
  Lockeds({required this.status,required this.gridPoints,this.eraces = const []});

  final List<Vector2> gridPoints;
  final LockedsStatus status;

  final List<Vector2> eraces;
  
  @override
  FutureOr<void> onLoad() {
    //gridPointsの初めの点は原点、次の点が幅や高さを表す
    if(gridPoints.length==2){
      switch(status){
        case LockedsStatus.horizontal:{
          for(double i=0;i<gridPoints[1].x;i++){
          add(LockedBlock(gridPoints[0].x +i, gridPoints[0].y));
          }
        }
        case LockedsStatus.vertical:{
          for(double j=0;j<gridPoints[1].y;j++){
          add(LockedBlock(gridPoints[0].x , gridPoints[0].y +j));
          }
        }
        case LockedsStatus.rectangle:{
          for(double i=0;i<gridPoints[1].x;i++){
          add(LockedBlock(gridPoints[0].x +i, gridPoints[0].y));
          add(LockedBlock(gridPoints[0].x +i, gridPoints[0].y + gridPoints[1].y -1));
          }
          for(double j=0;j<gridPoints[1].y-2;j++){
          add(LockedBlock(gridPoints[0].x , gridPoints[0].y+1 +j));
          add(LockedBlock(gridPoints[0].x + gridPoints[1].x-1 , gridPoints[0].y+1 +j));
          }
        }
      }
      }
      removeAll(children.whereType<StageObject>().where((s) => 
      eraces.contains(s.gridPosition) ).toList());
    return super.onLoad();
  }

}