import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';


class Spring extends SpriteAnimationComponent with StageBlock implements StageObject{
  Spring(double x,double y):gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));
  
  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();


  @override
  FutureOr<void> onLoad() {
    playing = false;
    final springSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 21*16, 80, 16, 16);
    final springSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 22*16, 80, 16, 16);
    final springSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 23*16, 80, 16, 16);
    animation = SpriteAnimation.variableSpriteList([
      springSprite1,springSprite2,springSprite3
    ], stepTimes: [0.1,0.1,0.1]);
    position = gridPosition * 16;
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }
}