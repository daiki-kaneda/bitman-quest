import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';

class PauseButton extends HudButtonComponent{
  PauseButton():super(
    button:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 1, 101, 48, 48),
      size: Vector2.all(30),
    ),
    buttonDown:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 768, 591, 48, 48),
      size: Vector2.all(30),
      
    ),
    size: Vector2.all(30),
    margin: const EdgeInsets.only(left: 30,top: 5),
    );

    @override
  Future<void> onLoad() {
    onPressed = (){
      final bitmanGame = (game as BitmanQuest);
      bitmanGame.router.pushNamed('pause-dialog');
      };
    return super.onLoad();
  }

}