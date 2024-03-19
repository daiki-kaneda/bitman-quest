
import 'dart:async';
import 'dart:math';
import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/simple_move_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum SpawnerStatus{
  grave1,grave2,bugPot
}



class Spawner extends SpriteComponent
with StageBlock,EnemyCondition implements StageObject,Enemy,HasPathEffect{
  Spawner(double x,double y,{required this.status,this.direction=ProjectileDirection.bitmanDirection,this.abnormalStatus=AbnormalStatus.normal,
  this.path,this.pathDuration=2.5,this.pathAlternate=true}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final SpawnerStatus status;

  final ProjectileDirection direction;


  @override 
  int life = 5;

  @override 
  final int power = 0;

  @override 
  final isPressable = false;

  @override 
  final AbnormalStatus abnormalStatus;

  @override
  final velocity = Vector2.zero();

  @override
  Path? path;
  @override
  bool pathAlternate;
  @override
  double pathDuration;

  @override
  bool isAttacked =false;

  @override
  FutureOr<void> onLoad() {

    final grave1Sprite = getSprite(SpriteSheets.coloredTransparentPacked, 0, 224, 16, 16);
    final grave2Sprite = getSprite(SpriteSheets.coloredTransparentPacked, 16, 224, 16, 16);
    final bugPotSprite = getSprite(SpriteSheets.coloredTransparentPacked, 80, 224, 16, 16);

    switch(status){
      case SpawnerStatus.grave1:{
      sprite=grave1Sprite;
      }
      case SpawnerStatus.grave2:{
      sprite=grave2Sprite;

      }
      case SpawnerStatus.bugPot:{
      sprite=bugPotSprite;
      add(ColorEffect(Colors.lightGreen, const Offset(0.1, 0.9), EffectController(
        duration: 0.3,
        alternate: true,
        infinite: true,
        onMax:() =>  findParent<World>()!.add(
          Projectile.fromPosition(position, status: ProjectileStatus.bug, direction:direction,amount: 600),
      )
      )));
      }

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
    add(RectangleHitbox(collisionType: CollisionType.passive));
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

    print(findParent<World>()!.children.whereType<SimpleMoveEnemy>()
      .where((enemy) => enemy.status == SimpleMoveEnemyStatus.ghost1)
      .toList().length);
    if(status==SpawnerStatus.grave1){
      if(
      findParent<World>()!.children.whereType<SimpleMoveEnemy>()
      .where((enemy) => enemy.status == SimpleMoveEnemyStatus.ghost1)
      .toList().length<5
      ){
        if(children.whereType<ColorEffect>().isEmpty){
        add(ColorEffect(Colors.black,const Offset(0.0, 0.5), EffectController(
          duration: 1.0,
          alternate: true,
        ),onComplete: () =>findParent<World>()!.add(
          SimpleMoveEnemy(position.x/16, position.y/16, status: SimpleMoveEnemyStatus.ghost1, interval: 2)
          
        )));
        }
      }
    }

    if(status==SpawnerStatus.grave2){
       if(
      findParent<World>()!.children.whereType<SimpleMoveEnemy>()
      .where((enemy) => enemy.status == SimpleMoveEnemyStatus.ghost2)
      .toList().length<5
      ){
        if(children.whereType<ColorEffect>().isEmpty){
        add(ColorEffect(Colors.black,const Offset(0.0, 0.5), EffectController(
          duration: 1.0,
          alternate: true,
        ),onComplete: () =>findParent<World>()!.add(
          SimpleMoveEnemy(position.x/16, position.y/16, status: SimpleMoveEnemyStatus.ghost2, interval: 2)
          
        )));
        }
      }
    }
    super.update(dt);
  }

}