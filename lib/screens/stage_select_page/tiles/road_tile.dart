import 'dart:async';
import 'dart:math';
import 'dart:ui';


import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/stage_select_page/bitman.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/tile.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';


enum RoadStatus{
  vertical,horizontal,
  turnUpRight,turnUpLeft,turnDownRight,turnDownLeft,
  deadEndTop,deadEndBottom,deadEndLeft,deadEndRight,red,bridge
}


class RoadTile extends SpriteGroupComponent<bool> with HasGameRef<BitmanQuest>,TapCallbacks
implements Tile{
  RoadTile({required this.status,required this.lastStageIndex,required double x,required double y}):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final RoadStatus status;

  final int lastStageIndex;


  @override
  FutureOr<void> onLoad() {
     current=game.userData.progress.lastClearedStage() >= lastStageIndex;
    final Sprite walkableSprite;
    final Sprite unwalkableSprite;
    final roadSprite1 = getSprite(SpriteSheets.coloredTransparent, 138, 17, 13, 16);
    final roadSprite2 = getSprite(SpriteSheets.coloredTransparent, 155, 19, 14, 14);
    final roadSprite3 = getSprite(SpriteSheets.coloredTransparent, 205, 19, 13, 14);
    final roadSprite4 = getSprite(SpriteSheets.coloredTransparent, 103, 222, 14, 14);
    final roadSprite5 = getSprite(SpriteSheets.coloredTransparent, 222, 273, 14, 14);
    final unwalkableRoad1 = getSprite(SpriteSheets.monochromeTransparent, 138, 17, 13, 16);
    final unwalkableRoad2 = getSprite(SpriteSheets.monochromeTransparent, 155, 19, 14, 14);
    final unwalkableRoad3 = getSprite(SpriteSheets.monochromeTransparent, 205, 19, 13, 14);
    final unwalkableRoad4 = getSprite(SpriteSheets.monochromeTransparent, 103, 222, 14, 14);
    final unwalkableRoad5 = getSprite(SpriteSheets.monochromeTransparent, 222, 273, 14, 14);
    // final grayFilter = Paint()
    // ..colorFilter = const ColorFilter.mode(
    //   Color.fromARGB(133, 76, 78, 78),
    //   BlendMode.color,
    // );
    switch(status){
      case RoadStatus.vertical:
      walkableSprite = roadSprite1;
      unwalkableSprite = unwalkableRoad1;
      case RoadStatus.horizontal:
      walkableSprite = roadSprite1;
      unwalkableSprite = unwalkableRoad1;
      angle = pi/2;
      case RoadStatus.turnUpLeft:
      walkableSprite = roadSprite2;
       unwalkableSprite = unwalkableRoad2;
      scale = Vector2(1, -1);
      case RoadStatus.turnUpRight:
      walkableSprite = roadSprite2;
       unwalkableSprite = unwalkableRoad2;
      scale = Vector2.all(-1);
      case RoadStatus.turnDownLeft:
      walkableSprite = roadSprite2;
       unwalkableSprite = unwalkableRoad2;
      case RoadStatus.turnDownRight:
      walkableSprite = roadSprite2;
       unwalkableSprite = unwalkableRoad2;
      scale = Vector2(-1, 1);
      case RoadStatus.deadEndTop:
      walkableSprite = roadSprite3;
       unwalkableSprite = unwalkableRoad3;
      case RoadStatus.deadEndBottom:
      walkableSprite = roadSprite3;
       unwalkableSprite = unwalkableRoad3;
      angle = pi;
      case RoadStatus.deadEndRight:
      walkableSprite = roadSprite3;
       unwalkableSprite = unwalkableRoad3;
      angle = pi/2;
      case RoadStatus.deadEndLeft:
      walkableSprite = roadSprite3;
       unwalkableSprite = unwalkableRoad3;
      angle = pi * 3/2;
      case RoadStatus.red:
      walkableSprite = roadSprite4;
       unwalkableSprite = unwalkableRoad4;
      case RoadStatus.bridge:
      walkableSprite = roadSprite5;
       unwalkableSprite = unwalkableRoad5;
  }
  //true:walkable,false:unwalkable
  sprites = {
    true:walkableSprite,
    false:unwalkableSprite
  };
  
  position = Vector2(gridPosition.x * 16 + 8, gridPosition.y * 16 + 8);
  
  }

  @override
  void onTapUp(TapUpEvent event) {
    if(current!){
    parent!.firstChild<BitmanInMap>()!
    .add(MoveEffect.to(
      Vector2(gridPosition.x * 16, gridPosition.y * 16),
      EffectController(duration: 1.5)));
    }
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    current=game.userData.progress.lastClearedStage() >= lastStageIndex;
    if(!current!){
  opacity = 0.2;
  }else{
    opacity = 1.0;
  }
    super.update(dt);
  }
}