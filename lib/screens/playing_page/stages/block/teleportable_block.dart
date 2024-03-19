import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/reference_point.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';



class TeleportableBlock extends SpriteAnimationComponent
with StageBlock,CollisionCallbacks implements StageObject,Ridable{
  TeleportableBlock(double x,double y,{required this.targetPoints,required this.color,this.count=3}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;


  @override
  final velocity = Vector2.zero();

  final List<Vector2> targetPoints;

  final Color color;

  final double count;

  int? index;

  @override
  FutureOr<void> onLoad() {
    final oneSprite=getSprite(SpriteSheets.coloredTransparent, 715, 256, 14, 14);
    final twoSprite=getSprite(SpriteSheets.coloredTransparent, 732, 256, 14, 14);
    final threeSprite=getSprite(SpriteSheets.coloredTransparent, 749, 256, 14, 14);
    final fourSprite=getSprite(SpriteSheets.coloredTransparent, 766, 256, 14, 14);
    final fiveSprite=getSprite(SpriteSheets.coloredTransparent, 783, 256, 14, 14);
    final sixSprite=getSprite(SpriteSheets.coloredTransparent, 800, 256, 14, 14);
    if(count ==1){
      animation = SpriteAnimation.spriteList([
      oneSprite
    ], stepTime: 1.0);
    }else if(count==2){
      animation = SpriteAnimation.spriteList([
      twoSprite,oneSprite
    ], stepTime: 1.0);
    }else if(count==3.0){
      animation = SpriteAnimation.spriteList([
      threeSprite,twoSprite,oneSprite
    ], stepTime: 1.0);
    }else if(count==4.0){
      animation = SpriteAnimation.spriteList([
      fourSprite,threeSprite,twoSprite,oneSprite
    ], stepTime: 1.0);
    }else if(count==5){
      animation = SpriteAnimation.spriteList([
      fiveSprite,fourSprite,threeSprite,twoSprite,oneSprite
    ], stepTime: 1.0);
    }else if(count==6){
      animation = SpriteAnimation.spriteList([
      sixSprite,fiveSprite,fourSprite,threeSprite,twoSprite,oneSprite
    ], stepTime: 1.0);
    }else{
      animation = SpriteAnimation.spriteList([
      threeSprite,twoSprite,oneSprite
    ], stepTime: 1.0);
    }
    add(ColorEffect(color, const Offset(0.9, 1.0), EffectController(
      duration: 1,
      infinite: true
    )));
    add(OpacityEffect.fadeOut(
      EffectController(
        duration: count.toDouble(),
        alternate: false,
        infinite: true,
        onMax: () {
          if(targetPoints.isNotEmpty){
            if(index == null){
              index = 0;
            }else{
              index = index! % targetPoints.length;
            }
            final referencePosition = findParent<World>()!.firstChild<ReferencePoint>()!.position;
            position = referencePosition + targetPoints[index!]*16;
            index = index! + 1;
        }
        },
      ),
      
    ));
    add(RectangleHitbox(collisionType: CollisionType.passive));
    position = gridPosition*16;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }
}