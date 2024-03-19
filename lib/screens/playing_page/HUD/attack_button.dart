import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/arms/weapon.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/attack_component/attack.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/attack_component/bomb.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';


class AttackButton extends HudButtonComponent{
  AttackButton(this.bitman):super(
    button:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 329, 465, 80, 80),
      size: Vector2.all(80),
    )..opacity = 0.75,
    buttonDown:SpriteComponent(
      sprite: getSprite(SpriteSheets.uiSprites, 878, 479, 80, 80),
      size: Vector2.all(80),
      
    ),
    size: Vector2.all(80),
    margin: const EdgeInsets.only(right: 40,bottom: 140),
    );

    final Bitman bitman;

    bool isPressed = false;

    @override
  Future<void> onLoad() {
    onPressed = isPressed ? null: (){
      isPressed = true;
      final bool isLeft = bitman.scale.x<0;
      final Vector2 p = bitman.position;
      switch(bitman.weapon){
        case BitmanWeapon.none:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        case BitmanWeapon.shovel:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        bitman.findParent<World>()!.firstChild<Weapon>()!
        .add(RotateEffect.by(isLeft ? -pi * 1/2 : pi *1/2, EffectController(
          duration: 0.2,
          alternate: true
        )));
        case BitmanWeapon.pick:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        bitman.findParent<World>()!.firstChild<Weapon>()!
        .add(RotateEffect.by(isLeft ? -pi * 1/2 : pi * 1/2, EffectController(
          duration: 0.2,
          alternate: true
        )));
        case BitmanWeapon.sword:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        bitman.findParent<World>()!.firstChild<Weapon>()!
        .add(RotateEffect.by(isLeft ? -pi * 1/2: pi * 1/2, EffectController(
          duration: 0.2,
          alternate: true
        )));
        case BitmanWeapon.arrow:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          ..angle = isLeft ? -pi/4:pi/4
          );
        
         bitman.findParent<World>()!.firstChild<Weapon>()!
        .add(RotateEffect.by(isLeft ? pi * 1/4: -pi * 1/4, EffectController(
          duration: 0.2,
          alternate: true
        )));
        case BitmanWeapon.gun:
        bitman.findParent<World>()!.add(
          AttackComponent(bitman.weapon)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        
         bitman.findParent<World>()!.firstChild<Weapon>()!
        .add(RotateEffect.by(isLeft ? pi * 1/4: -pi * 1/4, EffectController(
          duration: 0.2,
          alternate: true
        )));
        
        case BitmanWeapon.bomb:
        bitman.findParent<World>()!.add(
          ThrowWeapon(status: ThrowWeaponStatus.bomb)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        bitman.weapon = BitmanWeapon.none;
        case BitmanWeapon.dynamite:
        bitman.findParent<World>()!.add(
          ThrowWeapon(status: ThrowWeaponStatus.dynamite)
          ..position = isLeft ? Vector2(p.x-14, p.y) :Vector2(p.x+14, p.y)
          ..scale.x = isLeft ? -1 : 1
          );
        bitman.weapon = BitmanWeapon.none;
      }
      isPressed = false;
    };
    return super.onLoad();
  }

}