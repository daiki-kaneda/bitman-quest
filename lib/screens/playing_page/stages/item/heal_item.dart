import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/item.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';


enum HealItemStatus{
  apple,pear,cheese,meat
}
class HealItem extends SpriteComponent with StageBlock implements StageObject,StageItem{
  HealItem(double x,double y,{required this.status}):
  gridPosition=Vector2(x, y),super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final HealItemStatus status;
  int healing = 1;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    switch(status){
      case HealItemStatus.apple:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 528, 288, 16, 16);
      healing = 1;
      case HealItemStatus.pear:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 544, 288, 16, 16);
      healing = 2;
      case HealItemStatus.cheese:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 544, 256, 14, 14);
      healing = 4;
      case HealItemStatus.meat:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 528, 256, 16, 16);
      healing = 6;
    }
    position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    add(ScaleEffect.to(Vector2.all(1.1), EffectController(
      duration: 1.0,
      alternate: true,
      infinite: true
    )));
    add(OpacityEffect.to(0.85, EffectController(
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