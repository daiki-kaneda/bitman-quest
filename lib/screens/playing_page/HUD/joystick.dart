

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class JoyStick extends JoystickComponent with HasGameRef<BitmanQuest>{
  JoyStick():super(
    knob:SpriteComponent(
      size: Vector2.all(80),
      sprite: getSprite(
        SpriteSheets.uiSprites, 1, 1, 96, 97
        )
    )..opacity = 0.5,
    background:SpriteComponent(
      size: Vector2.all(130),
      sprite: getSprite(
        SpriteSheets.uiSprites, 1, 592, 160, 160
        )
    ),
    margin:const EdgeInsets.only(left: 70, bottom: 40) );
}