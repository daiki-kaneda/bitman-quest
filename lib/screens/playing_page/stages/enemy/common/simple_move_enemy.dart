
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/condition_decoration/condition_decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';


enum SimpleMoveEnemyStatus{
  aligator,bat,slime,skelton,ghost1,ghost2
}
class SimpleMoveEnemy extends SpriteGroupComponent<SimpleMoveEnemyStatus> with StageBlock,EnemyCondition implements Enemy,StageObject,HasPathEffect{
 SimpleMoveEnemy(
  double x,
  double y,
  {required this.status,
  required this.interval,
  this.abnormalStatus= AbnormalStatus.normal,
  this.path,
  this.pathDuration = 2.5,
  this.pathAlternate = true
  }):gridPosition = Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);
  
  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();

  @override
  int life = 1;

  @override
  int power = 1;

  @override
  bool isPressable = true;

  @override 
  final AbnormalStatus abnormalStatus;

  @override
  bool isAttacked =false;

  final int interval;

  bool disappear=false;

  final SimpleMoveEnemyStatus status;

  @override
  Path? path;
  @override
  final double pathDuration;
  @override
  final bool pathAlternate;

  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites ={
      SimpleMoveEnemyStatus.aligator:getSprite(SpriteSheets.coloredTransparent, 494, 137, 14, 14),
      SimpleMoveEnemyStatus.bat:getSprite(SpriteSheets.coloredTransparentPacked, 416, 128, 16, 16),
      SimpleMoveEnemyStatus.slime:getSprite(SpriteSheets.coloredTransparentPacked, 432, 128, 16, 16),
      SimpleMoveEnemyStatus.skelton:getSprite(SpriteSheets.coloredTransparentPacked, 464, 96, 16, 16),
      SimpleMoveEnemyStatus.ghost1:getSprite(SpriteSheets.coloredTransparentPacked, 416, 96, 16, 16),
      SimpleMoveEnemyStatus.ghost2:getSprite(SpriteSheets.coloredTransparentPacked, 432, 96, 16, 16),
    } ;
    switch(status){
     case  SimpleMoveEnemyStatus.aligator:{
       add(MoveEffect.by(Vector2(16*interval.toDouble(), 0),EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true,
      onMax: flipHorizontally,
      onMin: flipHorizontally
    )));
    life=1;
    power=2;
    isPressable = false;
     }
     case SimpleMoveEnemyStatus.bat:{
       add(MoveEffect.by(Vector2(0,16*interval.toDouble()),EffectController(
      duration: 2.0,
      alternate: true,
      infinite: true,
    )));
    life=1;
    power=1;
    isPressable = true;
     }
     case SimpleMoveEnemyStatus.slime:{
      final random = Random();
      final colors = <Color>[
        Colors.blue,Colors.red,Colors.purple
      ];
      add(ColorEffect(
        colors[random.nextInt(colors.length)],
        const Offset(0.7, 0.2), EffectController(
          duration: 2.0,
          alternate: true,
          infinite: true
        )));
    life=1;
    power=2;
    isPressable = true;
     }
          case  SimpleMoveEnemyStatus.skelton:{
       add(MoveEffect.by(Vector2(-16*interval.toDouble(),0),EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true,
      onMax:(){
        findParent<World>()!.add(
          Projectile.fromPosition(position, status: ProjectileStatus.bone, direction:ProjectileDirection.bitmanDirection,amount: 256)
        );
      } ,
    )));
    life=1;
    power=2;
    isPressable = false;
     }
     case SimpleMoveEnemyStatus.ghost1:{
       final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
        final random = Random();
      add(
        SizeEffect.to(Vector2.all(24), EffectController(
          duration: 1.5,
          infinite: true,
          alternate: true,
          onMax: (){
             findParent<World>()!.add(
          Projectile.fromPosition(position, status: ProjectileStatus.fire, direction:ProjectileDirection.bitmanDirection,amount: 256)
        );
        flipHorizontally();
          },
          onMin: flipHorizontally
        ), )
          );
    life=1;
    power=1;
    isPressable = true;
     }
     case SimpleMoveEnemyStatus.ghost2:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
        final random = Random();
       add(
        SizeEffect.to(Vector2.all(24), EffectController(
          duration: 1.5,
          infinite: true,
          alternate: true,
          onMax: (){
             findParent<World>()!.add(
          Projectile.fromPosition(position, status: ProjectileStatus.fire, direction:ProjectileDirection.bitmanDirection,amount: 256)
        );
        flipHorizontally();
          },
          onMin: flipHorizontally
        ), )
          );
    life=1;
    power=1;
    isPressable = true;
     }
    }

    position = Vector2(gridPosition.x*16 +8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    setConditionDecoration();

    if(path!=null){
      add(MoveAlongPathEffect(path!, EffectController(
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
      if([SimpleMoveEnemyStatus.ghost1,SimpleMoveEnemyStatus.ghost2].contains(status)){
        if(!disappear){
          disappear=true;
        removeAll(children.whereType<SizeEffect>());
         add(
        SizeEffect.to(Vector2.all(5), EffectController(
          duration: 1.0
        ),
        onComplete: removeFromParent),
      );
        }
      }else{
        add(
        MoveEffect.by(Vector2(0, 330), EffectController(
          duration: 1.0
        ),
        onComplete: removeFromParent),
      );
      }
    }

    if([SimpleMoveEnemyStatus.ghost1,SimpleMoveEnemyStatus.ghost2].contains(status)){
       final bitman = findParent<World>()!.firstChild<Bitman>()!;
      if(children.whereType<MoveEffect>().isEmpty){
      add(MoveEffect.by((bitman.position-position).normalized() *48, EffectController(
        duration: Random().nextDouble()+1.0,
      ),onComplete: () => removeAll(children.whereType<MoveEffect>()),));
      }
    }
    super.update(dt);
  }
}