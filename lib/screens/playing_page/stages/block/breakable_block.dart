import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/attack_component/attack.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum BreakableBlockStatus{
  normal,hard,projectileBreakable ,stalk,chain
}
//normalは素手でも壊せるが、hardはピッケル、スコップ、爆発でしか壊せない
//normalの色は茶色、hardの色は黒色
//projectileは敵の遠距離攻撃で壊れてしまう
//stalk,chainは剣か爆発でしか切れないブロック

class BreakableBlock extends SpriteAnimationGroupComponent<BreakableBlockStatus> 
with StageBlock,CollisionCallbacks implements StageObject,Ridable{
  BreakableBlock(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final BreakableBlockStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    current = status;
    playing = false;
    final normalSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 257, 1, 14, 14);
    final normalSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 65, 1, 14, 14);
    final normalSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 49, 1, 14, 14);
    final normalSprite4 = getSprite(SpriteSheets.coloredTransparentPacked, 33, 1, 14, 14);
    final normalSprite5 = getSprite(SpriteSheets.coloredTransparentPacked, 17, 1, 14, 14);
    final stalkSprite = getSprite(SpriteSheets.monochrome, 304, 0,16, 16);
    final chainSprite = getSprite(SpriteSheets.monochrome, 48, 16,16, 16);
    animations={
      BreakableBlockStatus.normal:SpriteAnimation.spriteList([
        normalSprite1,normalSprite2,normalSprite3,normalSprite4,normalSprite5
      ], stepTime: 0.1),
      BreakableBlockStatus.hard:SpriteAnimation.spriteList([
        normalSprite1,normalSprite2,normalSprite3,normalSprite4,normalSprite5
      ], stepTime: 0.1),
      BreakableBlockStatus.projectileBreakable:SpriteAnimation.spriteList([
        normalSprite1,normalSprite2,normalSprite3,normalSprite4,normalSprite5
      ], stepTime: 0.1),
      BreakableBlockStatus.stalk:SpriteAnimation.spriteList([
        stalkSprite
      ], stepTime: 1.0),
      BreakableBlockStatus.chain:SpriteAnimation.spriteList([
        chainSprite
      ], stepTime: 1.0)
    };
    

    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    switch(status){
    case BreakableBlockStatus.normal:break;
    case BreakableBlockStatus.hard:
    add(ColorEffect(Colors.black38,const Offset(0.4, 0.6), EffectController(
      duration: 1.0,
      alternate: true,
      infinite: true
    )));
    case BreakableBlockStatus.projectileBreakable:{
      add(ColorEffect(Colors.white,const Offset(0.6, 1.0), EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true
    )));
    }
    case BreakableBlockStatus.chain:{
      add(ColorEffect(Colors.grey,const Offset(0.6, 1.0), EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true
    )));
    }
    case BreakableBlockStatus.stalk:{
      add(ColorEffect(Colors.green,const Offset(0.6, 1.0), EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true
    )));
    }
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(status==BreakableBlockStatus.normal){
    if (other is AttackComponent) {
      playing = true;
      removeAll(children.whereType<RectangleHitbox>());
      add(OpacityEffect.fadeOut(
          EffectController(
            duration: 0.5,
          ),
          onComplete: removeFromParent));
    }

    if (other is Bitman) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;
        final collisionNormal = absoluteCenter - mid;
        collisionNormal.normalize();
        //bitmanがほとんど真下からブロックに衝突する場合
        if (Vector2(0, -1).dot(collisionNormal) > 0.9) {
          playing = true;
          removeAll(children.whereType<RectangleHitbox>());
          add(OpacityEffect.fadeOut(
              EffectController(
                duration: 0.5,
              ),
              onComplete: removeFromParent));
        }
      }
    }
    }

   if(status==BreakableBlockStatus.hard){
    if (other is AttackComponent && [
      BitmanWeapon.bomb,BitmanWeapon.dynamite,BitmanWeapon.pick,BitmanWeapon.shovel
      ].contains(other.status)) {
      playing = true;
      removeAll(children.whereType<RectangleHitbox>());
      add(OpacityEffect.fadeOut(
          EffectController(
            duration: 0.5,
          ),
          onComplete: removeFromParent));
    }

    }

    if(status==BreakableBlockStatus.projectileBreakable){
    if (other is Projectile) {
      playing = true;
      removeAll(children.whereType<RectangleHitbox>());
      add(OpacityEffect.fadeOut(
          EffectController(
            duration: 0.5,
          ),
          onComplete: removeFromParent));
    }
    }

    if(status==BreakableBlockStatus.stalk || status==BreakableBlockStatus.chain){
    if (other is AttackComponent && [
      BitmanWeapon.bomb,BitmanWeapon.dynamite,BitmanWeapon.sword
      ].contains(other.status)) {
      //playing = true;
      removeAll(children.whereType<RectangleHitbox>());
      add(OpacityEffect.fadeOut(
          EffectController(
            duration: 0.5,
          ),
          onComplete: removeFromParent));
    }

    }



    super.onCollision(intersectionPoints, other);
  }
}
