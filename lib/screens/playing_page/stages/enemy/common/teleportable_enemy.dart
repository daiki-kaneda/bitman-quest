
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/reference_point.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum TeleportableEnemyStatus{
  miniWitch,
}
class TeleportableEnemy extends SpriteComponent with StageBlock,EnemyCondition,HasGameRef<BitmanQuest> implements Enemy,StageObject{
 TeleportableEnemy
(double x,double y,{required this.status,required this.interval,this.abnormalStatus = AbnormalStatus.normal,this.targetPoints=const []}):gridPosition = Vector2(x, y),
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

  final int interval;

  final TeleportableEnemyStatus status;

  final List<Vector2> targetPoints;

  @override
  bool isAttacked =false;



  @override
  FutureOr<void> onLoad() {
    final random = Random();
    final referencePosition = findParent<World>()!.firstChild<ReferencePoint>()!.position;
    switch(status){
      case TeleportableEnemyStatus.miniWitch:{
        sprite=getSprite(SpriteSheets.coloredTransparentPacked, 416, 144, 16, 16);
        add(OpacityEffect.fadeOut(EffectController(
      duration: 1.0,
      alternate: true,
      infinite: true,
      onMax: (){
        if(targetPoints.isNotEmpty){
          final randomPoint = targetPoints[random.nextInt(targetPoints.length)];
          position = referencePosition + Vector2(randomPoint.x*16+8, randomPoint.y*16+8);
        }
      },
      onMin: () => {
        findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.bitmanDirection,amount: 240))
      },
    )));
        }
    }
    position = Vector2(gridPosition.x*16 +8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    setConditionDecoration();
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

    //add dynamic effect that depends on Bitman's position
    
    
    
    super.update(dt);
  }
}
