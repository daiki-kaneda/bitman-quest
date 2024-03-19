import 'dart:async';


import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/tile.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

enum EntranceStatus{
  normal,golem,wizard,ghost,swordsman
}

class EntranceTile extends SpriteComponent with HasGameRef<BitmanQuest>,TapCallbacks
implements Tile{
  EntranceTile(this.stageIndex,double x,double y,{this.status=EntranceStatus.normal}):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final int stageIndex;
  bool isCleared = false;
  final EntranceStatus status;

  @override
  FutureOr<void> onLoad() {
    isCleared = stageIndex <= game.userData.progress.lastClearedStage();
    if(isCleared){
    sprite = getSprite(
      SpriteSheets.coloredTransparent,
       291, 137, 12, 14
       );
    }else{
      switch(status){
        case EntranceStatus.normal:
        sprite = getSprite(
      SpriteSheets.coloredTransparent,
       358, 188, 14, 14
       );  
        case EntranceStatus.golem:
        sprite = getSprite(
      SpriteSheets.coloredTransparent,
       511, 103, 14, 14
       );  
        case EntranceStatus.wizard:
        sprite = getSprite(
      SpriteSheets.coloredTransparent,
       408, 17, 14, 14
       );  
        case EntranceStatus.ghost:
        sprite = getSprite(
      SpriteSheets.coloredTransparent,
       477, 103, 14, 14
       );  
        case EntranceStatus.swordsman:
        sprite = getSprite(
      SpriteSheets.coloredTransparent,
       476, 34, 14, 14
       );  
      }
    }
    
    position = Vector2(gridPosition.x * 16, gridPosition.y * 16);
  }

  @override
  void onTapDown(TapDownEvent event) {
    if(stageIndex<=game.userData.progress.lastClearedStage()+1){
    game.state = game.state.copyWith(stageSelected: stageIndex);
    }
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if(stageIndex<=game.userData.progress.lastClearedStage()+1){
     game.router.pushRoute(PlayingRoute());
    }
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    isCleared = stageIndex <= game.userData.progress.lastClearedStage();
    if(isCleared){
      sprite = getSprite(
      SpriteSheets.coloredTransparent,
       291, 137, 12, 14
       );
    }
    super.update(dt);
  }

}