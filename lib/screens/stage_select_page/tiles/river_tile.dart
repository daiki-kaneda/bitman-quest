
import 'dart:async';


import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/tile.dart';
import 'package:flame/components.dart';


enum FencePosition{
  none,right,left,top,bottom,bottomRight,bottomLeft,topRight,topLeft
}
class RiverTile extends SpriteComponent with HasGameRef<BitmanQuest>
implements Tile{
  RiverTile(this.fence,double x,double y):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final FencePosition fence;

  @override
  FutureOr<void> onLoad() {
    switch(fence){
      case FencePosition.none:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         102, 187, 16, 16);
      case FencePosition.top:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         102, 170, 16, 16);
      case FencePosition.bottom:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         102, 204, 16, 16);
      case FencePosition.left:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         85, 187, 16, 16);
      case FencePosition.right:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         119, 187, 16, 16);
      case FencePosition.topLeft:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         153, 187, 16, 16);
      case FencePosition.topRight:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         136, 187, 16, 16);
      case FencePosition.bottomLeft:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         153, 170, 16, 16);
      case FencePosition.bottomRight:
      sprite = getSprite(
        SpriteSheets.roguelikeDungeonTransparent,
         136, 170, 16, 16);
  }
  position = Vector2(gridPosition.x * 16, gridPosition.y * 16);
}
}