import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/danger_object.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';



class Dangers extends PositionComponent implements StageObject,HasPathEffect{
  Dangers(double x,double y,{required this.status,required this.length,required this.direction,
  this.path,this.pathDuration=2.5,this.pathAlternate=true}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final int length;
  final DangerObjectStatus status;
  final DangerObjectDirection direction;

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  @override
  FutureOr<void> onLoad() {

    Vector2 nextPosition(int i){
      switch(direction){
        case DangerObjectDirection.top:
        return Vector2(gridPosition.x+i, gridPosition.y);
        case DangerObjectDirection.bottom:
        return Vector2(gridPosition.x+i, gridPosition.y);
        case DangerObjectDirection.left:
        return Vector2(gridPosition.x, gridPosition.y+i);
        case DangerObjectDirection.right:
        return Vector2(gridPosition.x, gridPosition.y+i);
      }
    }

    for(var i=0;i<length;i++){
      add(
        DangerObject(nextPosition(i).x, nextPosition(i).y, status: status, direction:direction,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration)
      );
    }
    return super.onLoad();
  }

}