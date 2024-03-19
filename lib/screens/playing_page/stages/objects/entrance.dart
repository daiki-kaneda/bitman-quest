import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum EntranceBlockStatus{
  locked,open
}
//Entranceは他の75✖️20のタイルのステージに飛ばすブロック
class Entrance extends SpriteGroupComponent<EntranceBlockStatus> with StageBlock,CollisionCallbacks,HasGameRef<BitmanQuest> implements StageObject{
  Entrance(double x,double y,{required this.stageIndex,required this.status}):
  gridPosition=Vector2(x, y),super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final int stageIndex;

  EntranceBlockStatus status;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites = {
      EntranceBlockStatus.open:getSprite(SpriteSheets.coloredTransparent, 35, 154, 14, 14),
      EntranceBlockStatus.locked:getSprite(SpriteSheets.coloredTransparent, 1, 154, 14, 14)
    };
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is Bitman && current == EntranceBlockStatus.open){
      game.state = game.state.copyWith(
        stageSelected: stageIndex
      );
     game.router.pushReplacement(PlayingRoute()); 
    }
    super.onCollision(intersectionPoints, other);
  }
  
}