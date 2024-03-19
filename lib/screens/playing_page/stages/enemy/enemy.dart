import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/condition_decoration/condition_decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';



interface class Enemy  extends PositionComponent{
  Enemy({required this.life,required this.power,required this.isPressable,required this.abnormalStatus});

  final int power;
  int life;
  final bool isPressable;
  final AbnormalStatus abnormalStatus;
  bool isAttacked=false;

}


mixin EnemyCondition implements Enemy{
  void setConditionDecoration(){
    switch(abnormalStatus){
      case AbnormalStatus.poison:add(ColorEffect(Colors.green, const Offset(0.1, 0.9), EffectController(
        duration: 1.0,
        alternate: true,
        infinite: true,
      )));
      case AbnormalStatus.stun:add(ColorEffect(Colors.yellow, const Offset(0.1, 0.9), EffectController(
        duration: 1.0,
        alternate: true,
        infinite: true,
      )));
      default:
    }
  }
}

mixin EnemyHoming implements Enemy{
  void addHomingEffect({required double wait}){
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
      if(children.whereType<MoveEffect>().isEmpty){
      add(MoveEffect.to(bitman.position, EffectController(
        startDelay: wait,
        duration: Random().nextDouble()+1.0,
      ),onComplete: () => removeAll(children.whereType<MoveEffect>()),));
      }
    }
  }

