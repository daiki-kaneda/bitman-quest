
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';



class AttackComponent extends SpriteAnimationComponent with CollisionCallbacks{
  AttackComponent(this.status):super(size: Vector2.all(16),anchor: Anchor.center);

  final BitmanWeapon status;
  @override
  FutureOr<void> onLoad() async{
    final strikeSprite = getSprite(SpriteSheets.coloredTransparent, 427, 189, 12, 12);
    final slashSprite = getSprite(SpriteSheets.coloredTransparent, 410, 189, 12, 12);
    final shootSprite = getSprite(SpriteSheets.coloredTransparent, 239, 85, 14, 15);
    final arrowSprite = getSprite(SpriteSheets.coloredTransparentPacked, 640, 80, 16, 16);
    final explosionSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 464, 192, 16, 16);
    final explosionSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 496, 192, 16, 16);
    final explosionSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 448, 192, 16, 16);
    final explosionSprite4 = getSprite(SpriteSheets.coloredTransparentPacked, 480, 192, 16, 16);
    switch(status){
      case BitmanWeapon.none:animation = SpriteAnimation.spriteList([strikeSprite], stepTime: 1.0);
      case BitmanWeapon.shovel:animation = SpriteAnimation.spriteList([slashSprite], stepTime: 1.0);
      case BitmanWeapon.pick:animation = SpriteAnimation.spriteList([slashSprite], stepTime: 1.0);
      case BitmanWeapon.sword:animation = SpriteAnimation.spriteList([slashSprite], stepTime: 1.0);
      case BitmanWeapon.gun:animation = SpriteAnimation.spriteList([shootSprite], stepTime: 1.0);
      case BitmanWeapon.arrow:animation = SpriteAnimation.spriteList([arrowSprite], stepTime: 1.0);
      case BitmanWeapon.bomb:animation = SpriteAnimation.spriteList([explosionSprite1,explosionSprite2,explosionSprite3,explosionSprite4], stepTime: 0.1);
      case BitmanWeapon.dynamite:animation = SpriteAnimation.spriteList([explosionSprite1,explosionSprite2,explosionSprite3,explosionSprite4], stepTime: 0.1);
    }
    final joystick = findParent<World>()!.firstChild<Bitman>()!.joystick;
    if(status == BitmanWeapon.gun){
      size = Vector2(4, 4);
      add(ColorEffect(Colors.red,const Offset(1.0,1.0), EffectController(
      duration: 1.5
    )));
      add(MoveEffect.by(Vector2(480 * scale.x, 0), EffectController(
        duration: 2.5
      ),
      onComplete: () => removeFromParent(),));
    }else if(status==BitmanWeapon.arrow){
      add(MoveEffect.by(Vector2(240 * scale.x, 0), EffectController(
        duration: 1.0
      ),
      onComplete: () => removeFromParent(),));
    }else{
      if([BitmanWeapon.shovel,BitmanWeapon.pick,BitmanWeapon.sword].contains(status)){
        //slash is bigger than strike
      size=Vector2(50,16);
      }
      if([BitmanWeapon.bomb,BitmanWeapon.dynamite].contains(status)){
        size =Vector2(60, 60);
      }
    add(ColorEffect(Colors.red,const Offset(0.4,0.1), EffectController(
      duration: 0.4
    )));
    add(OpacityEffect.fadeOut(EffectController(
      duration: 0.4
    ),
    onComplete: () => removeFromParent(),));
    }
    if(status == BitmanWeapon.arrow){
      add(PolygonHitbox.relative([
        Vector2(1/3, -1),Vector2(1,-1/3),Vector2(-1/3, 1),Vector2(-1,1/3),
      ], parentSize: size));
    }else{
       add(RectangleHitbox(isSolid: true));
    }
    return super.onLoad();

  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is Enemy){
      final bitman = (parent as World).firstChild<Bitman>()!;
      int attackDamage;
      switch(status){
        case BitmanWeapon.none:
        attackDamage = 1;
        case BitmanWeapon.shovel:
        attackDamage = 2;
        case BitmanWeapon.pick:
        attackDamage = 2;
        case BitmanWeapon.sword:
        attackDamage = 3;
        case BitmanWeapon.arrow:
        attackDamage=1;
        case BitmanWeapon.gun:
        attackDamage = 2;
        case BitmanWeapon.bomb:
        attackDamage=10;
        case BitmanWeapon.dynamite:
        attackDamage =15;
      }
      //爆弾の場合は投げたと後の衝突時にはbitmanWeponはnoneなので、AttackComponentのstatusによって場合分けしよう
      if(!other.isAttacked){
        other.isAttacked = true;
         other.life -= attackDamage;
      other.add(
        OpacityEffect.fadeOut(
          EffectController(
            duration: 0.1,
            alternate: true,
            repeatCount: 2,
          ),
          onComplete: () => other.isAttacked = false,
        )
      );
         
      }
      
      print(other.life);
    }
    super.onCollision(intersectionPoints, other);
  }
}