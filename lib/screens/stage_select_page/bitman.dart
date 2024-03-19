
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';

class BitmanInMap extends SpriteAnimationComponent{
  BitmanInMap(double x,double y):
  gridPosition = Vector2(x, y),
  super(size:Vector2.all(16));

  final Vector2 gridPosition;
  @override
  FutureOr<void> onLoad() {
    final bitmanSprite1 = getSprite(
    SpriteSheets.coloredTransparent,
     308,
     124,
    12,
     11);
    final bitmanSprite2 = getSprite(
    SpriteSheets.coloredTransparent,
     342,
     123,
    12,
     11);
    
    animation = SpriteAnimation.variableSpriteList(
      [bitmanSprite1,bitmanSprite2],
       stepTimes: [0.3,0.5]);
    
    position = Vector2(gridPosition.x * 16, gridPosition.y * 16);
  }
}