import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum MassBlockStatus{
  xBlock,roughBlock,normal
}

class MassBlock extends SpriteGroupComponent<MassBlockStatus> 
with StageBlock implements StageObject,Ridable{
  MassBlock(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final MassBlockStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites={
      MassBlockStatus.xBlock:getSprite(SpriteSheets.coloredTransparent, 391, 34,16, 16),
      MassBlockStatus.normal:getSprite(SpriteSheets.coloredTransparent, 171, 290,14, 14),
      MassBlockStatus.roughBlock:getSprite(SpriteSheets.coloredTransparent, 391, 51,16, 16),
    };
    position = Vector2(gridPosition.x*16, gridPosition.y*16);

    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

}