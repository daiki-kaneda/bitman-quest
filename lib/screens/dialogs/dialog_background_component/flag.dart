import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Flag extends SpriteComponent with StageBlock implements StageObject{
  Flag(double x,double y,):
  gridPosition=Vector2(x, y),super(size: Vector2.all(32));

  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(SpriteSheets.coloredTransparent, 290, 154, 14, 14);
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    return super.onLoad();
  }

}