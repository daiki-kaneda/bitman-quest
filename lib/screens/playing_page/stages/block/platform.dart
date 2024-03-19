import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';


class Platform extends PositionComponent implements StageObject,HasPathEffect{
  Platform(double x,double y,{required this.length,required this.fallable,this.path,this.pathAlternate=true,this.pathDuration=2.5}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final int length;

  final bool fallable;

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  @override
  FutureOr<void> onLoad() {

    double nextPosition(int i){
        return gridPosition.x+i;
      }

    if(!fallable){
       if(length>=3){
    for(var i=0;i<length;i++){
      if(i==0){
        add(PlatformBlock(nextPosition(i), gridPosition.y, status: PlatformStatus.left,path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
      }else if(i==length-1){
        add(PlatformBlock(nextPosition(i), gridPosition.y, status: PlatformStatus.right,path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
      }else{
        add(PlatformBlock(nextPosition(i), gridPosition.y, status: PlatformStatus.normal,path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
      }
    }
    }
    }else{
      for(var i=0;i<length;i++){
         add(PlatformBlock(nextPosition(i), gridPosition.y, status: PlatformStatus.fallable,path: path,pathDuration: pathDuration));
      }
    }
    return super.onLoad();
  }

}