import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum EmitterStatus{
  fireballer,
}

class Emitter extends SpriteComponent with StageBlock implements StageObject {
  Emitter(double x,double y,{required this.abnormalStatus,required this.direction,required this.interval,this.status=EmitterStatus.fireballer}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);
  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final AbnormalStatus abnormalStatus;

  final ProjectileDirection direction;

  final EmitterStatus status;

  bool hasShoot = false;

  double interval;


  @override
  FutureOr<void> onLoad() {
    switch(status){
      case EmitterStatus.fireballer:{
    sprite = getSprite(SpriteSheets.coloredTransparentPacked,496, 176, 16, 16);
    switch(direction){
      case ProjectileDirection.top:scale = Vector2(1, -1);
      case ProjectileDirection.right:angle = -pi/2;
      case ProjectileDirection.left:angle = pi/2;
      case ProjectileDirection.topRight:angle = -3*pi/4;
      case ProjectileDirection.topLeft:angle =  -5*pi/4;
      case ProjectileDirection.bottomRight:angle =  -pi/4;
      case ProjectileDirection.bottomLeft:angle = pi/4;
      case ProjectileDirection.topLeftCurve:angle = -5*pi/4;
      case ProjectileDirection.topRightCurve:angle = -3*pi/4;
      case ProjectileDirection.bottomRightCurve:angle = -pi/4;
      case ProjectileDirection.bottomLeftCurve:angle = pi/4;
      default:
    }
      }
    }
    position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);

    Color color;
    switch(abnormalStatus){
      case AbnormalStatus.normal:color = Colors.red;
      case AbnormalStatus.poison:color = Colors.green;
      case AbnormalStatus.stun:color = Colors.yellow;
      default:color = Colors.yellow;
    }

    if(!hasShoot){
      hasShoot = true;
    add(ColorEffect(color, const Offset(0.1, 0.9), EffectController(
      duration: interval,
      infinite: true,
      onMax: () {
        final projectile=Projectile.fromPosition(
          position,
           status: ProjectileStatus.fireBall,
           direction: direction,
           abnormalStatus: abnormalStatus);
        findParent<World>()!.add(
          projectile
        );
      },
    ),onComplete:() => hasShoot=false,),);
    }
    super.update(dt);
  }
}