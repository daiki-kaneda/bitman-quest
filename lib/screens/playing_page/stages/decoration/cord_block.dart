import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum CordBlockStatus{
  thread,stalk,chain,wire
}

class CordBlock extends SpriteComponent
with StageBlock implements StageObject{
  CordBlock(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final CordBlockStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    switch(status){
      case CordBlockStatus.thread:{
      sprite=getSprite(SpriteSheets.monochrome, 80, 256,16, 16);
        }
      case CordBlockStatus.stalk:{
      sprite=getSprite(SpriteSheets.monochrome, 304, 0,16, 16);
      }
      case CordBlockStatus.chain:{
      sprite=getSprite(SpriteSheets.monochrome, 48, 16,16, 16);
      }
      case CordBlockStatus.wire:{
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 192, 192,16, 16);
      }
    }
  
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

}