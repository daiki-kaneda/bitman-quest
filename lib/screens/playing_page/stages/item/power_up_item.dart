import 'dart:async';
import 'dart:ui';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/item.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';


enum PowerUpItemStatus{
  speedUp
}
class PowerUpItem extends SpriteComponent with StageBlock implements StageObject,StageItem{
  PowerUpItem(double x,double y,{required this.status}):
  gridPosition=Vector2(x, y),super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final PowerUpItemStatus status;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    switch(status){
      case PowerUpItemStatus.speedUp:
      sprite =  getSprite(SpriteSheets.coloredTransparentPacked, 624, 0, 16, 16);
    }
    position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    add(ScaleEffect.to(Vector2.all(1.1), EffectController(
      duration: 1.0,
      alternate: true,
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