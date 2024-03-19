import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/item.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';



class WeaponItem extends SpriteComponent with StageBlock implements StageObject,StageItem{
  WeaponItem(double x,double y,{required this.status}):
  gridPosition=Vector2(x, y),super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final BitmanWeapon status;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    switch(status){
      case BitmanWeapon.shovel:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 673, 81, 14, 14);
      case BitmanWeapon.pick:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 690, 82, 12, 12);
      case BitmanWeapon.sword:
      sprite = getSprite(SpriteSheets.coloredTransparent, 545, 137, 14, 14);
      case BitmanWeapon.arrow:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 609, 81, 14, 14);
      case BitmanWeapon.gun:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 592, 144, 16, 16);
      case BitmanWeapon.bomb:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 720, 144, 16, 16);
      case BitmanWeapon.dynamite:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 736, 144, 16, 16);
      default:
      sprite = getSprite(SpriteSheets.coloredTransparentPacked, 673, 81, 14, 14);
    }
    position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    add(ScaleEffect.to(Vector2.all(1.1), EffectController(
      duration: 1.0,
      alternate: true,
      infinite: true
    )));
    // add(OpacityEffect.to(0.5, EffectController(
    //   duration: 0.5,
    //   alternate: true,
    //   infinite: true
    // )));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }
}