
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum FrameDirection{
  top,left,bottom,right,topLeft,topRight,bottomRight,bottomLeft
}

enum FrameStatus {
  soft,medium,hard,screen
}

class FrameTile extends SpriteGroupComponent<FrameDirection> with StageBlock implements StageObject{
  FrameTile(
    double x,
    double y,
    {required this.status,
    required this.direction}):
    gridPosition=Vector2(x,y),
    super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity=Vector2.zero();

  final FrameStatus status;
  final FrameDirection direction;

   final initialEffect = ColorEffect(Colors.white, const Offset(0, 0.1),EffectController(
    duration: 1.0,
    alternate: true,
    infinite: true
  ));

  final solvingEffect = ColorEffect(Colors.yellow, const Offset(0.4, 1.0),EffectController(
    duration: 1.0,
    alternate: true,
    infinite: true
  ));

  final successEffect = ColorEffect(Colors.blue, const Offset(0.4, 1.0),EffectController(
    duration: 1.0,
    alternate: true,
    infinite: true
  ));
  @override
  FutureOr<void> onLoad() {
    current = direction;
    switch(status){
      case FrameStatus.soft:
      sprites = {
        FrameDirection.top:getSprite(SpriteSheets.coloredTransparent, 273+16, 324, 16, 16),
        FrameDirection.bottom:getSprite(SpriteSheets.coloredTransparent, 273+16, 324+16*2, 16, 16),
        FrameDirection.right:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 324+16*1, 16, 16),
        FrameDirection.left:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 324+16*1, 16, 16),
        FrameDirection.topLeft:getSprite(SpriteSheets.coloredTransparent, 273, 324, 16, 16),
        FrameDirection.topRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 324+16*0, 16, 16),
        FrameDirection.bottomLeft:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 324+16*2, 16, 16),
        FrameDirection.bottomRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 324+16*2, 16, 16)
      };
      case FrameStatus.medium:
      sprites = {
        FrameDirection.top:getSprite(SpriteSheets.coloredTransparent, 273+16, 273, 16, 16),
        FrameDirection.bottom:getSprite(SpriteSheets.coloredTransparent, 273+16, 273+16*2, 16, 16),
        FrameDirection.right:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 273+16*1, 16, 16),
        FrameDirection.left:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 273+16*1, 16, 16),
        FrameDirection.topLeft:getSprite(SpriteSheets.coloredTransparent, 273, 273, 16, 16),
        FrameDirection.topRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 273+16*0, 16, 16),
        FrameDirection.bottomLeft:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 273+16*2, 16, 16),
        FrameDirection.bottomRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 273+16*2, 16, 16)
      };
      case FrameStatus.hard:
      sprites = {
        FrameDirection.top:getSprite(SpriteSheets.coloredTransparent, 273+16, 222, 16, 16),
        FrameDirection.bottom:getSprite(SpriteSheets.coloredTransparent, 273+16, 222+16*2, 16, 16),
        FrameDirection.right:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 222+16*1, 16, 16),
        FrameDirection.left:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 222+16*1, 16, 16),
        FrameDirection.topLeft:getSprite(SpriteSheets.coloredTransparent, 273, 222, 16, 16),
        FrameDirection.topRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 222+16*0, 16, 16),
        FrameDirection.bottomLeft:getSprite(SpriteSheets.coloredTransparent, 273+16*0, 222+16*2, 16, 16),
        FrameDirection.bottomRight:getSprite(SpriteSheets.coloredTransparent, 273+16*2, 222+16*2, 16, 16)
      };
      case FrameStatus.screen:
      sprites = {
        FrameDirection.top:getSprite(SpriteSheets.coloredTransparentPacked, 16, 256, 16, 16),
        FrameDirection.bottom:getSprite(SpriteSheets.coloredTransparentPacked, 16, 256+16*2, 16, 16),
        FrameDirection.right:getSprite(SpriteSheets.coloredTransparentPacked, 16*2, 256+16*1, 16, 16),
        FrameDirection.left:getSprite(SpriteSheets.coloredTransparentPacked, 0, 256 +16*1, 16, 16),
        FrameDirection.topLeft:getSprite(SpriteSheets.coloredTransparentPacked, 0, 256, 16, 16),
        FrameDirection.topRight:getSprite(SpriteSheets.coloredTransparentPacked, 16*2, 256+16*0, 16, 16),
        FrameDirection.bottomLeft:getSprite(SpriteSheets.coloredTransparentPacked, 0, 256+16*2, 16, 16),
        FrameDirection.bottomRight:getSprite(SpriteSheets.coloredTransparentPacked, 16*2, 256+16*2, 16, 16)
      };
    }
    position = Vector2(16*gridPosition.x, 16*gridPosition.y);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
     final status = findParent<Problem>()!.status;
    if(status==ProblemStatus.initial){
      if(!children.contains(initialEffect)){
        removeAll(
          children.where((c) => [solvingEffect,successEffect].contains(c))
        );
        add(initialEffect);
      }
    }

    if(status==ProblemStatus.solving){
      if(!children.contains(solvingEffect)){
        removeAll(
          children.where((c) => [initialEffect,successEffect].contains(c))
        );
        add(solvingEffect);
      }
    }

    if(status==ProblemStatus.success){
      if(!children.contains(successEffect)){
        removeAll(
          children.where((c) => [solvingEffect,initialEffect].contains(c))
        );
        add(successEffect);
      }
    }

    super.update(dt);
  }

}