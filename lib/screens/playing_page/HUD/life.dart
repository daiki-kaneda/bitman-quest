
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

enum LifeStatus{
  full,lost,half
}
class Life extends SpriteGroupComponent<LifeStatus>{
  Life(this.heartIndex,{super.position,super.size,super.anchor});
  final int heartIndex;

  @override
  FutureOr<void> onLoad() {
    current = LifeStatus.full;
    final lifeSprite1 = getSprite(SpriteSheets.coloredTransparent,715, 172, 14, 12 );
    final lifeSprite2 = getSprite(SpriteSheets.coloredTransparent,681, 172, 14, 12);
    final lifeSprite3 = getSprite(SpriteSheets.coloredTransparent,698, 172, 14, 12);

    sprites={
      LifeStatus.full:lifeSprite1,
      LifeStatus.lost:lifeSprite2,
      LifeStatus.half:lifeSprite3
    };
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final currentLives = findParent<PlayingPage>()!.state.lives;

    if (currentLives >= heartIndex) {
      current = LifeStatus.full;
    } else if (currentLives >= heartIndex-1) {
      current = LifeStatus.half;
    } else {
      current = LifeStatus.lost;
    }
    super.update(dt);
  }
}

class LifeWithMargin extends HudMarginComponent{
  LifeWithMargin(this.lifeIndex,this.xMargin):super(
    margin: EdgeInsets.only(top:10,right:xMargin),
    );

  final int lifeIndex;
  final double xMargin;

  @override
  FutureOr<void> onLoad() {
    add(Life(lifeIndex,size: Vector2.all(30)));
    return super.onLoad();
  }

}



