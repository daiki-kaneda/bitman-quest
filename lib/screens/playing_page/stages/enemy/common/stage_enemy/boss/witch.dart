import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/reference_point.dart';
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



class Witch extends SpriteComponent with StageBlock,EnemyCondition,EnemyHoming,HasGameRef<BitmanQuest> implements Enemy,StageObject{
Witch(double x,double y,{this.abnormalStatus = AbnormalStatus.normal,required this.normalTargetPoints,required this.angryTargetPoints,required this.crazyTargetPoints}):gridPosition = Vector2(x, y),
  super(size: Vector2.all(24),anchor: Anchor.center);
  
  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();

  @override
  int life = 40;

  @override
  int power = 4;

  @override
  bool isPressable = false;

  @override
  final AbnormalStatus abnormalStatus;

  @override
  bool isAttacked =false;

  BossStatus current=BossStatus.normal;

  bool addCrazyEffect = false;
  bool addAngryEffect = false;

  SequenceEffect? normalEffect;
  SequenceEffect? angryEffect;
  SequenceEffect? crazyEffect;

  final List<Vector2> normalTargetPoints;
  final List<Vector2> angryTargetPoints;
  final List<Vector2> crazyTargetPoints;
  @override
  FutureOr<void> onLoad() {
    final random = Random();
    assert(normalTargetPoints.isNotEmpty && angryTargetPoints.isNotEmpty && crazyTargetPoints.isNotEmpty);
    sprite = sprite = getSprite(
      SpriteSheets.coloredTransparent,
       408, 17, 14, 14
       );
    position = Vector2(gridPosition.x*16+16, gridPosition.y*16+16);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    setConditionDecoration();
    normalEffect = SequenceEffect([
      ColorEffect(Colors.yellow, const Offset(0.1, 0.9), EffectController(
          duration: 0.75,
          alternate: true,
          repeatCount: 1,
          onMax: () => findParent<World>()!.add(Projectile.fromPosition(
            Vector2(position.x+16, position.y-16), status: ProjectileStatus.fireBall, direction: ProjectileDirection.bitmanDirection,amount: 250)),
        )),
      OpacityEffect.fadeOut(EffectController(
        duration: 2.0,
        alternate: true,
        onMax: (){
        final target = normalTargetPoints[random.nextInt(normalTargetPoints.length)];
        final ref = findParent<World>()!.firstChild<ReferencePoint>()!.position;
        position = ref + Vector2(target.x*16 +16, target.y*16 +16);
        }
      ),)
    ],
    alternate: false,
    infinite: true);
    angryEffect = SequenceEffect([
      ColorEffect(Colors.orange, const Offset(0.1, 0.9), EffectController(
          duration: 0.5,
          alternate: true,
          repeatCount: 2,
          onMax: () => findParent<World>()!.add(Projectile.fromPosition(
            Vector2(position.x+16, position.y-16), status: ProjectileStatus.fireBall, direction: ProjectileDirection.bitmanDirection,amount: 300)),
        )),
      OpacityEffect.fadeOut(EffectController(
        duration: 1.0,
        alternate: true,
        onMax: (){
        final target = angryTargetPoints[random.nextInt(angryTargetPoints.length)];
        final ref = findParent<World>()!.firstChild<ReferencePoint>()!.position;
        position = ref + Vector2(target.x*16 +16, target.y*16 +16);
        }
      ),)
    ],
    alternate: false,
    infinite: true);
    crazyEffect = SequenceEffect([
      ColorEffect(Colors.red, const Offset(0.1, 0.9), EffectController(
          duration: 0.5,
          alternate: true,
          repeatCount: 3,
          onMax: () => findParent<World>()!.add(Projectile.fromPosition(
            Vector2(position.x+16, position.y-16), status: ProjectileStatus.fireBall, direction: ProjectileDirection.bitmanDirection,amount: 350)),
        )),
      OpacityEffect.fadeOut(EffectController(
        duration: 0.8,
        alternate: true,
        onMax: (){
        final target = crazyTargetPoints[random.nextInt(crazyTargetPoints.length)];
        final ref = findParent<World>()!.firstChild<ReferencePoint>()!.position;
        position = ref + Vector2(target.x*16 +16, target.y*16 +16);
        }
      ),)
    ],
    alternate: false,
    infinite: true);

    add(normalEffect!);
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
        normalEffect,
        angryEffect,
        ].contains(c)));
      add(crazyEffect!);
      // if(path!=null)add(crazyMoveEffect!);

      addCrazyEffect=true;
    }else if(life<=30&&!addAngryEffect){
      removeAll(children.where((c) => [
        normalEffect,
        crazyEffect,
        ].contains(c)));
      add(angryEffect!);
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
