import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';



class MusicToggle extends SpriteGroupComponent<bool> with HasGameRef<BitmanQuest>,TapCallbacks{

  @override
  FutureOr<void> onLoad() {
    current = game.settingData.isBGM;
    sprites = {
      true:getSprite(SpriteSheets.uiSprites, 151, 101, 48, 48),
      false:getSprite(SpriteSheets.uiSprites, 387, 101, 48, 48)
    };
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(0.85);
    super.onTapDown(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1);
    super.onTapCancel(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1);
    if(current!){
       game.settingData.isBGM = false;
       current = false;
    }else{
      game.settingData.isBGM = true;
       current = true;
    }
    game.savedata.saveSettingData(
          game.settingData
        );
    super.onTapUp(event);
  }
}