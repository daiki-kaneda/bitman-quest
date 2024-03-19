import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

//Powered by Flameなど書くべきかも？
class SplashPage extends Component with TapCallbacks,HasGameRef<BitmanQuest>{
   @override
  FutureOr<void> onLoad() {
    final bitmanSprite1 = getSprite(
      SpriteSheets.coloredTransparent,
       308,
       124,
        12,
        11);
    add(SpriteComponent(
      sprite:bitmanSprite1,
      size: Vector2.all(200),
      position: game.size/2,
      anchor: Anchor.center));
        }
  @override
  void onTapDown(TapDownEvent event) {
    //game.router.pushNamed('home');
     game.router.pushNamed('home');
    super.onTapDown(event);
  }

  @override
  bool containsLocalPoint(Vector2 point) =>true;
}