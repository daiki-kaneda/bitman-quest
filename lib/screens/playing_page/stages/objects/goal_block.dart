import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';



class GoalBlock extends SpriteComponent with StageBlock implements StageObject{
  GoalBlock(double x,double y,{required this.stageIndex}):
  gridPosition=Vector2(x, y),super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final int stageIndex;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(SpriteSheets.coloredTransparent, 290, 154, 14, 14);
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

  @override
  void onRemove() {
   // resetPosition();
    super.onRemove();
  }
}