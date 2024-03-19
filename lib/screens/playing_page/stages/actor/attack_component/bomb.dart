import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/attack_component/attack.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum ThrowWeaponStatus{
  bomb,dynamite
}
class ThrowWeapon extends SpriteGroupComponent<ThrowWeaponStatus> with CollisionCallbacks{
  ThrowWeapon({required this.status}):super(size: Vector2.all(14),anchor: Anchor.center);

  final ThrowWeaponStatus status;

  BitmanWeapon? weapon;
  @override
  FutureOr<void> onLoad() {
    current = status;
    final bombSprite = getSprite(SpriteSheets.coloredTransparentPacked, 720, 144, 16, 16);
    final dynamiteSprite = getSprite(SpriteSheets.coloredTransparentPacked, 736, 144, 16, 16);
    sprites={
      ThrowWeaponStatus.bomb:bombSprite,
      ThrowWeaponStatus.dynamite:dynamiteSprite
    };
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    switch(status){
      case ThrowWeaponStatus.bomb:weapon = BitmanWeapon.bomb;
      case ThrowWeaponStatus.dynamite:weapon = BitmanWeapon.dynamite;
    }
    priority = bitman.priority+1;
    if(bitman.scale.x>0){
    add(
      MoveAlongPathEffect(Path()..quadraticBezierTo(80, -160, 160, 80), EffectController(
        duration: 1.5
      ),oriented: true,onComplete: (){
        removeFromParent();
        findParent<World>()!.add(
          AttackComponent(weapon!)
          ..position = position
        );
  })
    );
    }else{
      add(
      MoveAlongPathEffect(Path()..quadraticBezierTo(-80, -160, -160, 80), EffectController(
        duration: 1.5
      ),oriented: true,onComplete: (){
        removeFromParent();
        findParent<World>()!.add(
          AttackComponent(weapon!)
          ..position = position
        );
  })
    );
    }

    add(
      ColorEffect(Colors.red,const Offset(0.1, 0.8), EffectController(
        duration: 0.3,
        alternate: true,
        repeatCount: 5
      ))
    );

    add(
      ScaleEffect.by(Vector2.all(1.2), EffectController(
        duration: 0.3,
        alternate: true,
        repeatCount: 5
      ))
    );

    add(CircleHitbox(collisionType: CollisionType.active));

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is! Bitman){
    removeFromParent();
    findParent<World>()!.add(
          AttackComponent(weapon!)
          ..position = position
        );
    }
    super.onCollision(intersectionPoints, other);
  }

}