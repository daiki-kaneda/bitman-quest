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

enum ScalableBlockAnchor{
  left,center,right
}

class ScalableBlock extends SpriteComponent
with StageBlock,CollisionCallbacks implements StageObject,Ridable,HasPathEffect{
  ScalableBlock(double x,double y,{this.basisAnchor=ScalableBlockAnchor.center,this.initialAmount=1,this.scaleAmount=2,this.scaleDuration=2.0,this.isHorizontal=true,this.path,this.pathAlternate = true,this.pathDuration=2.5}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;


  @override
  final velocity = Vector2.zero();

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  final ScalableBlockAnchor basisAnchor;

  final bool isHorizontal;

  final double initialAmount;
  final double scaleAmount;

  final double scaleDuration;

  @override
  FutureOr<void> onLoad() {
    if(isHorizontal){
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 320, 240, 16, 16);
      switch(basisAnchor){
        case ScalableBlockAnchor.left:{
           anchor=Anchor.centerLeft;
           position = Vector2(gridPosition.x*16, gridPosition.y*16+8);
        }
        case ScalableBlockAnchor.right:{
           anchor=Anchor.centerRight;
           position = Vector2(gridPosition.x*16+16, gridPosition.y*16+8);
        }
        case ScalableBlockAnchor.center:{
           anchor=Anchor.center;
           position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
        }
      }
      scale  = Vector2(initialAmount,3);
      add(ScaleEffect.to(Vector2(initialAmount+scaleAmount,3), EffectController(
        duration: scaleDuration,
        alternate: true,
        infinite: true
      )));
      add(PolygonHitbox.relative([
         Vector2(-1, -1/5),Vector2(1, -1/5),Vector2(1, 1/5),Vector2(-1, 1/5)
         ], parentSize: size)..renderShape=true);
    }else{
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 224, 49, 16, 14);
      switch(basisAnchor){
        case ScalableBlockAnchor.left:{
           anchor=Anchor.topCenter;
           position = Vector2(gridPosition.x*16+8, gridPosition.y*16);
        }
        case ScalableBlockAnchor.right:{
           anchor=Anchor.bottomCenter;
           position = Vector2(gridPosition.x*16+8, gridPosition.y*16+16);
        }
        case ScalableBlockAnchor.center:{
           anchor=Anchor.center;
           position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
        }
      }
       scale  = Vector2(3,initialAmount);
       add(ScaleEffect.to(Vector2(3,initialAmount+scaleAmount), EffectController(
        duration: scaleDuration,
        alternate: true,
        infinite: true
      )));
      add(PolygonHitbox.relative([
         Vector2(-1/5, -1),Vector2(1/5, -1),Vector2(1/5, 1),Vector2(-1/5, 1)
         ], parentSize: size));
    }
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