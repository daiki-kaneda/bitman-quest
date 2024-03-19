import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/sentence.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum DecorationStatus{
  grass,purpleGrass,cactus,ivy,seedLeaf,purplePlant,deadTree,sTrunk,mTrunk,lTrunk,grave1,grave2,grave3,hSkelton,dSkelton,bone,
  bSignboard,tSignboard,torch,yellowTorch,candle
}

class Decoration extends SpriteGroupComponent<DecorationStatus> 
with StageBlock implements StageObject{
  Decoration(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  final DecorationStatus status;

  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites={
      DecorationStatus.grass:getSprite(SpriteSheets.coloredTransparentPacked, 0, 32, 16, 16),
      DecorationStatus.purpleGrass:getSprite(SpriteSheets.coloredTransparentPacked, 336, 32, 16, 16),
      DecorationStatus.cactus:getSprite(SpriteSheets.coloredTransparentPacked, 96, 16, 16, 16),
      DecorationStatus.ivy:getSprite(SpriteSheets.coloredTransparentPacked, 32, 32, 16, 16),
      DecorationStatus.seedLeaf:getSprite(SpriteSheets.coloredTransparentPacked, 16, 32, 16, 16),
      DecorationStatus.purplePlant:getSprite(SpriteSheets.coloredTransparent, 205, 104, 14, 12),
      DecorationStatus.deadTree:getSprite(SpriteSheets.coloredTransparentPacked, 96, 32, 16, 16),
      DecorationStatus.sTrunk:getSprite(SpriteSheets.coloredTransparentPacked, 320, 96, 16, 16),
      DecorationStatus.mTrunk:getSprite(SpriteSheets.coloredTransparentPacked, 304, 96, 16, 16),
      DecorationStatus.lTrunk:getSprite(SpriteSheets.coloredTransparentPacked, 288, 96, 16, 16),
      DecorationStatus.grave1:getSprite(SpriteSheets.coloredTransparentPacked, 0, 224, 16, 16),
      DecorationStatus.grave2:getSprite(SpriteSheets.coloredTransparentPacked, 16, 224, 16, 16),
      DecorationStatus.grave3:getSprite(SpriteSheets.coloredTransparentPacked, 32, 224, 16, 16),
      DecorationStatus.hSkelton:getSprite(SpriteSheets.coloredTransparentPacked, 0, 240, 16, 16),
      DecorationStatus.dSkelton:getSprite(SpriteSheets.coloredTransparentPacked, 16, 240, 16, 16),
      DecorationStatus.bSignboard:getSprite(SpriteSheets.coloredTransparentPacked, 240, 112, 16, 16),
      DecorationStatus.tSignboard:getSprite(SpriteSheets.coloredTransparentPacked, 240, 128, 16, 16),
      DecorationStatus.torch:getSprite(SpriteSheets.coloredTransparentPacked, 48, 240, 16, 16),
      DecorationStatus.yellowTorch:getSprite(SpriteSheets.coloredTransparentPacked, 64, 240, 16, 16),
      DecorationStatus.candle:getSprite(SpriteSheets.coloredTransparentPacked, 80, 240, 16, 16),
    };
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

}