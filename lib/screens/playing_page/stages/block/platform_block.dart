import 'dart:async';
import 'dart:ui';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum PlatformStatus{
  left,normal,right,fallable
}

class PlatformBlock extends SpriteGroupComponent<PlatformStatus> 
with StageBlock implements StageObject,Ridable,HasPathEffect{
  PlatformBlock(double x,double y,{required this.status,this.path,this.pathAlternate = true,this.pathDuration=2.5}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final PlatformStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites={
      PlatformStatus.left:getSprite(SpriteSheets.coloredTransparentPacked, 336, 96,16, 16),
      PlatformStatus.normal:getSprite(SpriteSheets.coloredTransparentPacked, 352, 96,16, 16),
      PlatformStatus.right:getSprite(SpriteSheets.coloredTransparentPacked, 368, 96,16, 16),
      PlatformStatus.fallable:getSprite(SpriteSheets.coloredTransparentPacked, 288, 80,16, 16),
    };
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    add(PolygonHitbox.relative([
         Vector2(-1, -1),Vector2(-1, 0),Vector2(1, 0),Vector2(1, -1)
         ], parentSize: size));
    if(path!=null){
    add(MoveAlongPathEffect(path!, EffectController(
      duration: pathDuration,
      alternate: pathAlternate,
      infinite: true,
    )));
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
  }
}