
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_rotate_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum FloatingBlockStatus{
  rhombus,rectangle,pentagon,hexagon1,hexagon2,hexagon3,heptagon,octagon,nugget,trapezoid,triangle,rrect
}

class FloatingBlock extends SpriteGroupComponent<FloatingBlockStatus> 
with StageBlock implements StageObject,Ridable,HasPathEffect,HasRotateEffect{
  FloatingBlock(double x,double y,{required this.status,
  this.path,
  this.pathDuration=2.5,
  this.pathAlternate=true,
  this.initialAngle=0,
  this.rotateAngle=0,
  this.rotateDuration=2.5,
  this.rotateAlternate=true,
  this.customSize}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(96),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final FloatingBlockStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  Path? path;
  @override
  final double pathDuration;
  @override
  final bool pathAlternate;
  @override
  final double initialAngle;
  @override
  final double rotateAngle;
  @override
  final double rotateDuration;
  @override
  final bool rotateAlternate;

  Vector2? customSize;
  



  @override
  FutureOr<void> onLoad() {
    current = status;
      sprites={
        FloatingBlockStatus.rhombus:getSprite(SpriteSheets.platforms, 176, 16, 96, 96),
        FloatingBlockStatus.rectangle:getSprite(SpriteSheets.platforms, 32, 64, 96, 96),
        FloatingBlockStatus.pentagon:getSprite(SpriteSheets.platforms, 32, 176, 96, 96),
        FloatingBlockStatus.hexagon1:getSprite(SpriteSheets.platforms, 320, 64, 96, 128),
        FloatingBlockStatus.hexagon2:getSprite(SpriteSheets.platforms, 464, 48, 80, 80),
        FloatingBlockStatus.hexagon3:getSprite(SpriteSheets.platforms, 336, 224, 64, 64),
        FloatingBlockStatus.heptagon:getSprite(SpriteSheets.platforms, 208, 160, 96, 112),
        FloatingBlockStatus.octagon:getSprite(SpriteSheets.platforms, 432, 176, 96, 96),
        FloatingBlockStatus.nugget:getSprite(SpriteSheets.platforms, 576, 64, 96, 96),
        FloatingBlockStatus.trapezoid:getSprite(SpriteSheets.platforms, 560, 240, 160, 64),
        FloatingBlockStatus.triangle:getSprite(SpriteSheets.platforms, 688, 96, 160, 96),
        FloatingBlockStatus.rrect:getSprite(SpriteSheets.platforms, 896, 48, 80, 80),
    };
    position = Vector2(gridPosition.x*16 +48 , gridPosition.y*16 +48);
    switch(status){
        case FloatingBlockStatus.rhombus:{
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(-1, 0),Vector2(0, 1),Vector2(1, 0)
          ], parentSize: size,isSolid: true)..renderShape=false,);
        }
        case FloatingBlockStatus.rectangle:{
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          add(RectangleHitbox(collisionType: CollisionType.passive));
        }
        case FloatingBlockStatus.pentagon:{
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(-1, 0),Vector2(-1, 1),Vector2(1, 1),Vector2(1, 0)
          ], parentSize:size));
        }
        case FloatingBlockStatus.hexagon1:{
          size=Vector2(96, 128);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +48 , gridPosition.y*16 +64);
         add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(-1, -1/4),Vector2(-1, 1/4),Vector2(0, 1),Vector2(1, 1/4),Vector2(1, -1/4)
          ], parentSize:size));
        }
        case FloatingBlockStatus.hexagon2:{
          size=Vector2(80, 80);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +40 , gridPosition.y*16 +40);
         add(PolygonHitbox.relative([
            Vector2(-1/5, -1),Vector2(1, -1),Vector2(1, 1/5),Vector2(1/5, 1),Vector2(-1, 1),Vector2(-1, -1/5)
          ], parentSize:size));
        }
        case FloatingBlockStatus.hexagon3:{
          size=Vector2.all(64);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +32 , gridPosition.y*16 +32);
         add(PolygonHitbox.relative([
            Vector2(-1, 0),Vector2(-1, 1),Vector2(0, 1),Vector2(1, 0),Vector2(1, -1),Vector2(0, -1)
          ], parentSize:size));
        }
        case FloatingBlockStatus.heptagon:{
          size=Vector2(96, 112);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +48 , gridPosition.y*16 +56);
         add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(-1, -1/7),Vector2(-1, 3/7),Vector2(-1/3, 1),Vector2(1/3, 1),Vector2(1, 3/7),Vector2(1, -1/7)
          ], parentSize:size));
        }
        case FloatingBlockStatus.octagon:{
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          add(PolygonHitbox.relative([
             Vector2(-1/3, -1),Vector2(1/3, -1),Vector2(1, -1/3),Vector2(1, 1/3),Vector2(1/3, 1),Vector2(-1/3, 1),Vector2(-1, 1/3),Vector2(-1, -1/3)
          ], parentSize:size));
        }
        case FloatingBlockStatus.triangle:{
          size=Vector2(160, 96);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +80 , gridPosition.y*16 +48);
          add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(-1, 2/3),Vector2(-4/5, 1),Vector2(4/5, 1),Vector2(1, 2/3)
          ], parentSize:size));
        }
        case FloatingBlockStatus.trapezoid:{
          size=Vector2(160, 64);
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          position = Vector2(gridPosition.x*16 +80 , gridPosition.y*16 +32);
          add(PolygonHitbox.relative([
            Vector2(-3/5, -1),Vector2(-1, 0),Vector2(-1, 1),Vector2(1, 1),Vector2(1, 0),Vector2(3/5, -1),
          ], parentSize:size));
        }
        case FloatingBlockStatus.rrect:{
           size=Vector2(80, 80);
           if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
           position = Vector2(gridPosition.x*16 +40 , gridPosition.y*16 +40);
          add(PolygonHitbox.relative([
            Vector2(-3/5, -1),Vector2(-1, -3/5),Vector2(-1, 3/5),Vector2(-3/5, 1),Vector2(3/5, 1),Vector2(1, 3/5),Vector2(1, -3/5),Vector2(3/5, -1)
          ], parentSize:size));
        }
        case FloatingBlockStatus.nugget:{
          if(customSize!=null){
            size = customSize!*16;
            position = gridPosition*16 + size/2; }
          add(PolygonHitbox.relative([
            Vector2(0, -1),Vector2(1/3, -1),Vector2(1/3, -1/3),Vector2(1, 1/3),Vector2(1/3, 1),Vector2(0, 1),Vector2(-1, 0)
          ], parentSize:size));
        }
    }

    if(path!=null){
      add(MoveAlongPathEffect(path!, EffectController(
        duration: pathDuration,
        alternate: pathAlternate,
        infinite: true
      )));
    }
    angle = initialAngle;
    add(RotateEffect.by(rotateAngle, EffectController(
      duration: rotateDuration,
      alternate: rotateAlternate,
      infinite: true
    )));

    
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }


}