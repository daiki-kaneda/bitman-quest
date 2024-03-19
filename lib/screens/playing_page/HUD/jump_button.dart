
import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';

class JumpButton extends HudButtonComponent {
  JumpButton(this.bitman):super(
    button:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 569, 233, 80, 80),
      size: Vector2.all(110)
    ) ..opacity = 0.75,
    buttonDown:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 1, 791, 80, 80),
      size: Vector2.all(110)
    ),
    size: Vector2.all(110),
    margin: const EdgeInsets.only(right: 40,bottom: 20),
    );

    final Bitman bitman;

    @override
  Future<void> onLoad() {
    onPressed =  (){
      if(bitman.jumpCount>=2) return;

      bitman.current = BitmanStatus.jumping;
      bitman.isOnGround = false;
      bitman.jumpCount++;
      bitman.velocity.y = -bitman.jumpSpeed;

    };
    return super.onLoad();
  }
}