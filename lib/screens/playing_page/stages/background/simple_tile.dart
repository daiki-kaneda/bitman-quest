
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

class SimpleTile extends SpriteComponent implements StageObject{
  SimpleTile(double x,double y):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();
  
  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(
      SpriteSheets.coloredPacked, 0, 0, 16, 16
      );
    
    position=Vector2(gridPosition.x*16,gridPosition.y*16);
    return super.onLoad();
  }
}