import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

enum BackgroundStatus{
  cave,ailian,industry,ailian2,moon,ailian3,lava,cave2,sky,green
}
class StageBackground extends SpriteGroupComponent<BackgroundStatus> implements StageObject{
  StageBackground(this.status):super(size: Vector2(1200,320));

  @override
  final Vector2 gridPosition = Vector2.all(0);

  @override
  final Vector2 velocity = Vector2.zero();

  final BackgroundStatus status;
  
  @override
  FutureOr<void> onLoad() {
    current = status;
    sprites = {
      BackgroundStatus.cave:getSprite(SpriteSheets.background,10, 10, 1200, 320),
      BackgroundStatus.ailian:getSprite(SpriteSheets.background, 1230, 10, 1200, 320),
      BackgroundStatus.industry:getSprite(SpriteSheets.background, 10, 350, 1200, 320),
      BackgroundStatus.ailian2:getSprite(SpriteSheets.background, 1230, 350, 1200, 320),
      BackgroundStatus.moon:getSprite(SpriteSheets.background, 10, 690, 1200, 320),
      BackgroundStatus.ailian3:getSprite(SpriteSheets.background, 1230, 690, 1200, 320),
      BackgroundStatus.lava:getSprite(SpriteSheets.background, 10, 1030, 1200, 320),
      BackgroundStatus.cave2:getSprite(SpriteSheets.background, 1230, 1030, 1200, 320),
      BackgroundStatus.sky:getSprite(SpriteSheets.background, 10, 1370, 1200, 320),
      BackgroundStatus.green:getSprite(SpriteSheets.background, 1230, 1370, 1200, 320),
    };
    
    position=Vector2(gridPosition.x*16,gridPosition.y*16);
    return super.onLoad();
  }
}