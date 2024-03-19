import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class StartPage extends Component with HasGameRef<BitmanQuest>{
  //background(worldをaddして作る）はtutorialのemberquestのようにランダムな背景がスクロールされるものがいいかもしれない

  @override
  Future<void> onLoad() async{
    final startButtonSprite = getSprite(
      SpriteSheets.uiSprites,
       651,
       365,
       108,
       48);
    final settingButtonSprite = getSprite(
      SpriteSheets.uiSprites,
       569,
       315,
       48,
       48);
    final startButton = HudButtonComponent(
      button: SpriteComponent(
        sprite: startButtonSprite,
        scale: Vector2.all(2),
        anchor: Anchor.center),
      position: game.size/2,
      onPressed: () => game.router.pushNamed('stage-select'),
    );
    final settingButton = HudButtonComponent(
      button: SpriteComponent(
        sprite: settingButtonSprite,
        scale: Vector2.all(1.5),
      ),
      margin: const EdgeInsets.only(left:30,top: 20),
      onPressed: ()=>game.router.pushNamed('setting')
    );

    await addAll([
      startButton,settingButton
    ]);
    return super.onLoad();
  }
}