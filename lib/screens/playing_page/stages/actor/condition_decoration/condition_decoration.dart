
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

//ConditionDecoration must have parent(Bitman or Enemy) that will be decorated.
class ConditionDecoration extends SpriteGroupComponent<AbnormalStatus>{
  ConditionDecoration():super(size: Vector2.all(14),anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() {
    current = AbnormalStatus.normal;
    final poisonSprite = getSprite(SpriteSheets.coloredTransparent, 596, 188, 14, 14);
    final stunSprite = getSprite(SpriteSheets.coloredTransparentPacked, 576, 176, 16, 16);
     final healSprite = getSprite(SpriteSheets.coloredTransparentPacked, 624, 160, 16, 16);
    sprites={
      AbnormalStatus.poison:poisonSprite,
      AbnormalStatus.stun:stunSprite,
      AbnormalStatus.healing:healSprite
    };
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    priority = bitman.priority+1;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    current = bitman.condition;
     switch(current){
      case AbnormalStatus.poison:{
        if(children.whereType<ColorEffect>().isEmpty){
        add(ColorEffect(Colors.green, const Offset(0.1,0.9), EffectController(
          duration: 1.5,
          repeatCount: 3,
          onMax: () {
            findParent<PlayingPage>()!.state.lives -=1;
          },
        ),onComplete: () => bitman.condition = AbnormalStatus.normal,));
        }
      }
      case AbnormalStatus.stun:{
         if(children.whereType<ColorEffect>().isEmpty){
          final position = bitman.position.clone();
        add(ColorEffect(Colors.yellow, const Offset(0.1,0.9), EffectController(
          duration: 0.01,
          repeatCount: 100,
          onMax: () {
            bitman.position = position;
          },
        ),onComplete: () => bitman.condition = AbnormalStatus.normal,));
        }
      }
      case AbnormalStatus.healing:{
         if(children.whereType<ColorEffect>().isEmpty){
        add(OpacityEffect.fadeOut( EffectController(
          duration: 0.3,
          alternate: true,
        ),onComplete: () => bitman.condition = AbnormalStatus.normal,));
        add(MoveAlongPathEffect(Path()..addArc(Rect.fromCenter(center: const Offset(-7, 0), width: 14, height: 14), 0, 2*pi), EffectController(
          duration: 0.6,
          alternate: false
        )));
        }
      }
      default:{
        removeAll(children.whereType<ColorEffect>());
      }
    }
    
    position = Vector2(bitman.position.x, bitman.position.y-8);
    
    super.update(dt);
  }
}