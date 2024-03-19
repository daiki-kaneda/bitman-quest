
import 'dart:async';


import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/stage_select_page/bitman.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/tile.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';


class GroundTile extends SpriteComponent with HasGameRef<BitmanQuest>,TapCallbacks
implements Tile{
  GroundTile(this.level,double x,double y):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final int level;

  @override
  FutureOr<void> onLoad() {
    sprite = getSprite(
      SpriteSheets.coloredTiles,
       17*level.toDouble(), 0, 16, 16
       );
    
    position = Vector2(gridPosition.x * 16, gridPosition.y * 16);
  }

  @override
  void onTapUp(TapUpEvent event) {
   //for development
   parent!.firstChild<BitmanInMap>()!.position = position;
    super.onTapUp(event);
  }

}