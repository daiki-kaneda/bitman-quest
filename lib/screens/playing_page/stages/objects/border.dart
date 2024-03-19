import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';


class InputBlockBorder extends SpriteComponent  with StageBlock implements StageObject,Ridable{
  InputBlockBorder(double x,double y):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  bool inputting = false;
  
  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(
      SpriteSheets.coloredTransparent, 664, 239, 14, 14
      );
    
    position=Vector2(gridPosition.x*16,gridPosition.y*16);

    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }
}