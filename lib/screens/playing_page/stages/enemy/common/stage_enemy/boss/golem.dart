import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/boss.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/enemy_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';



class Golem extends SpriteComponent with StageBlock,EnemyCondition,EnemyHoming,HasGameRef<BitmanQuest> implements Enemy,StageObject,HasPathEffect{
Golem(double x,double y,{this.abnormalStatus = AbnormalStatus.normal,this.path,this.pathDuration=2.5,this.pathAlternate=true}):gridPosition = Vector2(x, y),
  super(size: Vector2.all(32),anchor: Anchor.center);
  
  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();

  @override
  int life = 50;

  @override
  int power = 4;

  @override
  bool isPressable = false;

  @override
  final AbnormalStatus abnormalStatus;

  @override
  bool isAttacked =false;

  @override
  Path? path;
  @override
  final double pathDuration;
  @override
  final bool pathAlternate;

  BossStatus current=BossStatus.normal;

  bool addCrazyEffect = false;
  bool addAngryEffect = false;

  ColorEffect? normalColorEffect;
  MoveAlongPathEffect? normalMoveEffect;
  ColorEffect? angryColorEffect;
  MoveAlongPathEffect? angryMoveEffect;
  ColorEffect? crazyColorEffect;
  MoveAlongPathEffect? crazyMoveEffect;

  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(SpriteSheets.coloredTransparentPacked, 481, 97, 14, 14);
    position = Vector2(gridPosition.x*16+16, gridPosition.y*16+16);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    setConditionDecoration();
    normalColorEffect=ColorEffect(Colors.yellow, const Offset(0.1, 0.9), EffectController(
          duration: 1.5,
          alternate: true,
          infinite: true,
          onMax: (){
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.left));
          }
        ));
    angryColorEffect=ColorEffect(Colors.orange, const Offset(0.1, 0.9), EffectController(
          duration: 0.8,
          alternate: true,
          infinite: true,
          onMax: (){
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.left));
          },
          onMin: (){
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.right));
          }
        ));
    crazyColorEffect=ColorEffect(Colors.red, const Offset(0.1, 0.9), EffectController(
          duration: 0.5,
          alternate: true,
          infinite: true,
          onMax: (){
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.left));
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.topLeft));
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.topLeftCurve));
          },
          onMin: (){
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.right));
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.topRight));
            findParent<World>()!.add(Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction: ProjectileDirection.topRightCurve));
          }
        ));
    add(normalColorEffect!);
    if(path!=null){
    normalMoveEffect=MoveAlongPathEffect(path!, EffectController(
      duration: pathDuration,
      alternate: pathAlternate,
      infinite: true
    )); 
    add(normalMoveEffect!);
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
    if(life<=10&&!addCrazyEffect){
      removeAll(children.where((c) => [
        normalColorEffect,
        angryColorEffect,
        ].contains(c)));
      add(crazyColorEffect!);
      // if(path!=null)add(crazyMoveEffect!);

      addCrazyEffect=true;
    }else if(life<=40&&!addAngryEffect){
      removeAll(children.where((c) => [
        normalColorEffect,
        crazyColorEffect,
        ].contains(c)));
      add(angryColorEffect!);
      // if(path!=null)add(angryMoveEffect!);
      
      addAngryEffect=true;
    }
    print(life);
    super.update(dt);
  }

  @override
  void onRemove() {
    findParent<World>()!.children.whereType<EnemyLockedBlock>()
    .forEach((block) {
      block.
      add(OpacityEffect.fadeOut(EffectController(
        duration: 1.5,
      ),
      onComplete: () => block.removeFromParent(),));
    });
    super.onRemove();
  }
}
