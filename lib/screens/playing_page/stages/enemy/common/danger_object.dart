
import 'dart:async';
import 'dart:math';
import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum DangerObjectStatus{
  fire,needle,icicle,
}

enum DangerObjectDirection{
  top,bottom,right,left
}

class DangerObject extends SpriteComponent
with StageBlock,EnemyCondition implements StageObject,Enemy,HasPathEffect{
  DangerObject(double x,double y,{required this.status,required this.direction,this.abnormalStatus=AbnormalStatus.normal,
  this.path,this.pathDuration=2.5,this.pathAlternate=true}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final DangerObjectStatus status;

  final DangerObjectDirection direction;

  @override 
  int life = 5;

  @override 
  final int power = 2;

  @override 
  final isPressable = false;

  @override 
  final AbnormalStatus abnormalStatus;

  @override
  final velocity = Vector2.zero();
  
  @override
  bool isAttacked =false;

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  bool addEffect = false;

  @override
  FutureOr<void> onLoad() {

    final needleSprite = getSprite(SpriteSheets.coloredTransparentPacked, 16*22, 0, 16, 16);
    final fireSprite = getSprite(SpriteSheets.coloredTransparentPacked, 240, 160, 16, 16);
    final icicleSprite = getSprite(SpriteSheets.monochrome, 96, 128, 16, 16);

    switch(status){
      case DangerObjectStatus.fire:
      sprite=fireSprite;
      add(PolygonHitbox.relative([
        Vector2(-1/2, -1),Vector2(1/2, -1),Vector2(1/2, 1),Vector2(1/2, 0),Vector2(-1/2, 1)
      ], parentSize: size));
      add(ColorEffect(Colors.blueGrey, const Offset(0.4,0.1 ), EffectController(
        duration: 0.5,
        alternate: true,
        infinite: true,
        onMax: flipHorizontally
      )));
      case DangerObjectStatus.needle:
      sprite=needleSprite;
      add(PolygonHitbox.relative([
        Vector2(-1, 1),Vector2(-1/2, 0),Vector2(0, 0.9),Vector2(1/2, 0),Vector2(1, 1)
      ], parentSize: size));
       case DangerObjectStatus.icicle:{
      sprite=icicleSprite;
      add(PolygonHitbox.relative([
        Vector2(-1, -1),Vector2(-1/2, 1),Vector2(0, -1),Vector2(1/2, 0),Vector2(1, -1)
      ], parentSize: size));

      add(ColorEffect(Colors.lightBlue, const Offset(0.5, 0.9), EffectController(
        duration: 1.5,
        alternate: true,
        infinite: true
      )));
       }
    }
    switch(direction){
      case DangerObjectDirection.top:
      scale = Vector2(1, -1);
      case DangerObjectDirection.bottom:break;
      case DangerObjectDirection.right:
      angle = -pi/2;
      case DangerObjectDirection.left:
      angle = pi/2;
    }
    position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
    setConditionDecoration();
    if(path!=null){
    add(MoveAlongPathEffect(path!,EffectController(
      duration: pathDuration,
      alternate: pathAlternate,
      infinite: true
    )));
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    if(life<=0){
      add(
        MoveEffect.by(Vector2(0, 330), EffectController(
          duration: 1.0
        ),
        onComplete: removeFromParent),
      );
    }

    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    if(status==DangerObjectStatus.icicle && !addEffect && (bitman.position.x-position.x).abs()<24 && bitman.position.y-position.y >0 ){
      addEffect = true;
      add(
        SequenceEffect([
        MoveEffect.by(Vector2(0, 330), EffectController(
          duration: 2.5
        ),
        onComplete: removeFromParent),
        ])
      );
    }

    super.update(dt);
  }

}