
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum GroundStatus{
  top,bottom,right,left,trCr,tlCr,brCr,blCr,trJt,tlJt,brJt,blJt,trSlope,tlSlope,brSlope,blSlope,deco,normal
}

class GroundBlock extends SpriteGroupComponent<GroundStatus> 
with StageBlock implements StageObject,Ridable{
  GroundBlock(double x,double y,{required this.status,this.isSolid=true}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final GroundStatus status;

  @override
  final velocity = Vector2.zero();

  bool isSolid;

  @override
  FutureOr<void> onLoad() {
    current = status;
    if(isSolid){
      sprites={
      GroundStatus.normal:getSprite(SpriteSheets.coloredPacked, 0, 0, 16, 16),
      GroundStatus.top:getSprite(SpriteSheets.coloredPacked, 288 + 16*1, 16*0, 16, 16),
      GroundStatus.left:getSprite(SpriteSheets.coloredPacked, 288 + 16*0, 16*1, 16, 16),
      GroundStatus.right:getSprite(SpriteSheets.coloredPacked, 288 + 16*2, 16*1, 16, 16),
      GroundStatus.bottom:getSprite(SpriteSheets.coloredPacked, 288 + 16*1, 16*2, 16, 16),
      GroundStatus.deco:getSprite(SpriteSheets.coloredPacked, 288 + 16*1, 16*1, 16, 16),
      GroundStatus.tlCr:getSprite(SpriteSheets.coloredPacked, 288 + 16*0, 16*0, 16, 16),
      GroundStatus.trCr:getSprite(SpriteSheets.coloredPacked, 288 + 16*2, 16*0, 16, 16),
      GroundStatus.brCr:getSprite(SpriteSheets.coloredPacked, 288 + 16*2, 16*2, 16, 16),
      GroundStatus.blCr:getSprite(SpriteSheets.coloredPacked, 288 + 16*0, 16*2, 16, 16),
      GroundStatus.trJt:getSprite(SpriteSheets.coloredPacked, 288 + 16*0, 16*4, 16, 16),
      GroundStatus.tlJt:getSprite(SpriteSheets.coloredPacked, 288 + 16*1, 16*4, 16, 16),
      GroundStatus.brJt:getSprite(SpriteSheets.coloredPacked, 288 + 16*0, 16*3, 16, 16),
      GroundStatus.blJt:getSprite(SpriteSheets.coloredPacked, 288 + 16*1, 16*3, 16, 16),
      GroundStatus.trSlope:getSprite(SpriteSheets.coloredPacked, 288 + 16*3, 16*3, 16, 16),
      GroundStatus.tlSlope:getSprite(SpriteSheets.coloredPacked, 288 + 16*2, 16*3, 16, 16),
      GroundStatus.brSlope:getSprite(SpriteSheets.coloredPacked, 288 + 16*3, 16*4, 16, 16),
      GroundStatus.blSlope:getSprite(SpriteSheets.coloredPacked, 288 + 16*2, 16*4, 16, 16),
    };
    }else{
    sprites={
      GroundStatus.top:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*1, 16*0, 16, 16),
      GroundStatus.left:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*0, 16*1, 16, 16),
      GroundStatus.right:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*2, 16*1, 16, 16),
      GroundStatus.bottom:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*1, 16*2, 16, 16),
      GroundStatus.deco:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*1, 16*1, 16, 16),
      GroundStatus.tlCr:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*0, 16*0, 16, 16),
      GroundStatus.trCr:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*2, 16*0, 16, 16),
      GroundStatus.brCr:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*2, 16*2, 16, 16),
      GroundStatus.blCr:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*0, 16*2, 16, 16),
      GroundStatus.trJt:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*0, 16*4, 16, 16),
      GroundStatus.tlJt:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*1, 16*4, 16, 16),
      GroundStatus.brJt:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*0, 16*3, 16, 16),
      GroundStatus.blJt:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*1, 16*3, 16, 16),
      GroundStatus.trSlope:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*3, 16*3, 16, 16),
      GroundStatus.tlSlope:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*2, 16*3, 16, 16),
      GroundStatus.brSlope:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*3, 16*4, 16, 16),
      GroundStatus.blSlope:getSprite(SpriteSheets.coloredTransparentPacked, 288 + 16*2, 16*4, 16, 16),
    };
    }
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    if([GroundStatus.tlSlope,GroundStatus.trSlope,GroundStatus.blSlope,GroundStatus.brSlope].contains(status)){
       if(status==GroundStatus.trSlope)add(PolygonHitbox.relative([Vector2(-1, -1),Vector2(-1, 1),Vector2(1, 1)], parentSize: size));
       if(status==GroundStatus.tlSlope)add(PolygonHitbox.relative([Vector2(1, -1),Vector2(1, 1),Vector2(-1, 1)], parentSize: size));
       if(status==GroundStatus.blSlope)add(PolygonHitbox.relative([Vector2(-1, -1),Vector2(1, -1),Vector2(1, 1)], parentSize: size));
       if(status==GroundStatus.brSlope)add(PolygonHitbox.relative([Vector2(-1, 1),Vector2(-1, -1),Vector2(1, -1)], parentSize: size));
    }else if([GroundStatus.tlJt,GroundStatus.trJt,GroundStatus.blJt,GroundStatus.brJt].contains(status)){
       add(RectangleHitbox(collisionType: CollisionType.passive));
    }else{
     add(RectangleHitbox(collisionType: CollisionType.passive));
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }


}