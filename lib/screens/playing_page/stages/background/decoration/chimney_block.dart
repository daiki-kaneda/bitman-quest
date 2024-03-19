
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum ChimneyBlockStatus{
  hOne,hOneJoint,vOne,vOneJoint,
}

class ChimneyBlock extends SpriteComponent
with StageBlock implements StageObject,Ridable{
  ChimneyBlock(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final ChimneyBlockStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    final vNormalSprite = getSprite(SpriteSheets.coloredTransparentPacked, 22*16,16, 15.9, 16);
    final vJointSprite = getSprite(SpriteSheets.coloredTransparentPacked, 22*16, 32, 15.9, 16);
    switch(status){
      case ChimneyBlockStatus.vOne:sprite = vNormalSprite;
      case ChimneyBlockStatus.vOneJoint:sprite = vJointSprite;
      case ChimneyBlockStatus.hOne:{
        sprite = vNormalSprite;
        anchor = Anchor.center;
        angle = pi/2;
        anchor = Anchor.topLeft;
      }
      case ChimneyBlockStatus.hOneJoint:{
        sprite = vJointSprite;
        anchor = Anchor.center;
        angle = pi/2;
        anchor = Anchor.topLeft;
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