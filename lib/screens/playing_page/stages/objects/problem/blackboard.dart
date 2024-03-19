
import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/objects/frame.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class BlackBoard extends PositionComponent implements StageObject{
  BlackBoard(double x,double y,this.w,this.h,{required this.status}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity=Vector2.zero();

  final FrameStatus status;

  final int w;
  final int h;

 
  @override
  FutureOr<void> onLoad() {
    add(FrameTile(gridPosition.x, gridPosition.y, status: status, direction: FrameDirection.topLeft));
    add(FrameTile(gridPosition.x + w-1, gridPosition.y, status: status, direction: FrameDirection.topRight));
    add(FrameTile(gridPosition.x, gridPosition.y+h-1, status: status, direction: FrameDirection.bottomLeft));
    add(FrameTile(gridPosition.x + w-1, gridPosition.y + h-1, status: status, direction: FrameDirection.bottomRight));
    addAll([
      for(int i=1;i<w-1;i++)
      FrameTile(gridPosition.x+i, gridPosition.y, status: status, direction:FrameDirection.top),

      for(int i=1;i<w-1;i++)
      FrameTile(gridPosition.x+i, gridPosition.y+h-1, status: status, direction:FrameDirection.bottom),

      for(int j=1;j<h-1;j++)
      FrameTile(gridPosition.x, gridPosition.y + j, status: status, direction:FrameDirection.left),

      for(int j=1;j<h-1;j++)
      FrameTile(gridPosition.x+w-1, gridPosition.y+j, status: status, direction:FrameDirection.right),
    ]);

    

    return super.onLoad();
  }

  
}