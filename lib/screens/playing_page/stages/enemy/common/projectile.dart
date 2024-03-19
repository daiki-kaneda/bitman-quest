
import 'dart:async';
import 'dart:math';
import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

enum ProjectileStatus{
  fireBall,fire,bone,bug
}



enum ProjectileDirection{
  top,right,left,bottom,topRight,topLeft,bottomRight,bottomLeft,
  topRightCurve,topLeftCurve,bottomRightCurve,bottomLeftCurve,homing,bitmanDirection
}

class Projectile extends SpriteAnimationComponent
with StageBlock,CollisionCallbacks,EnemyCondition implements StageObject,Enemy{
  Projectile._(double x,double y,{required this.status,required this.direction,this.abnormalStatus=AbnormalStatus.normal,this.amount = 96}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final ProjectileStatus status;

  final ProjectileDirection direction;

  final double amount;

  @override 
  int life = 5;

  @override 
  int power = 2;

  @override 
  final isPressable = false;

  @override
  final AbnormalStatus abnormalStatus;

  @override
  final velocity = Vector2.zero();

  @override
  bool isAttacked =false;




  factory Projectile.fromPosition(Vector2 position,{required ProjectileStatus status,required ProjectileDirection direction,AbnormalStatus abnormalStatus=AbnormalStatus.normal,double amount=96}){
    return Projectile._(0, 0, status: status, direction: direction,abnormalStatus: abnormalStatus,amount: amount)
    ..position += position;
  }

  @override
  FutureOr<void> onLoad() async{
    switch(status){
      case ProjectileStatus.fireBall:{
       final fireballSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 448, 176, 16, 16);
       animation = SpriteAnimation.spriteList([fireballSprite1], stepTime: 1.0);
            switch(direction){
      case ProjectileDirection.top:
      scale = Vector2(1, -1);
      add(
        MoveEffect.by(Vector2(0, -320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottom:add(
        MoveEffect.by(Vector2(0, 320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.right:
      angle = -pi/2;
      add(
        MoveEffect.by(Vector2(640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.left:
      angle = pi/2;
      add(
        MoveEffect.by(Vector2(-640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRight:
      angle = -3*pi/4;
      add(
        MoveEffect.by(Vector2(340,-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topLeft:
      angle = -5*pi/4;
      add(
        MoveEffect.by(Vector2.all(-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomRight:
      angle = -pi/4;
      add(
        MoveEffect.by(Vector2.all(340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomLeft:
      angle = pi/4;
      add(
        MoveEffect.by(Vector2(-340,340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRightCurve:
      angle = -3*pi/4;
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.topLeftCurve:
      angle = -5*pi/4;
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomRightCurve:
      angle = -pi/4;
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomLeftCurve:
      angle = pi/4;
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bitmanDirection:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
      add(
        MoveEffect.by((bitmanPosition-position).normalized()*amount, EffectController(
          duration: 1.5,
        ), onComplete: removeFromParent)
          );
      }
          default:
    }
    add(ColorEffect(Colors.red, const Offset(0.1, 0.9), EffectController(
        duration: 1.0,
        alternate: true,
        infinite: true,
      )));
    setConditionDecoration();
   // position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);

    add(PolygonHitbox.relative([
      Vector2(-1/10, -1),Vector2(-1/10, 1),Vector2(1/10, 1),Vector2(-1/10, 1)
      ], parentSize: size,isSolid: true));}
      case ProjectileStatus.fire:{
        power=1;
        life=2;
        final fireSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 240, 162, 16, 16);
       animation = SpriteAnimation.spriteList([fireSprite1], stepTime: 1.0);
            switch(direction){
      case ProjectileDirection.top:
      add(
        MoveEffect.by(Vector2(0, -320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottom:add(
        MoveEffect.by(Vector2(0, 320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.right:
      add(
        MoveEffect.by(Vector2(640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.left:
      add(
        MoveEffect.by(Vector2(-640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRight:
      add(
        MoveEffect.by(Vector2(340,-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topLeft:
      add(
        MoveEffect.by(Vector2.all(-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomRight:
      add(
        MoveEffect.by(Vector2.all(340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomLeft:
      add(
        MoveEffect.by(Vector2(-340,340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.topLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bitmanDirection:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
      add(
        MoveEffect.by((bitmanPosition-position).normalized()*amount, EffectController(
          duration: 1.5,
        ), onComplete: removeFromParent)
          );
      }
          default:
    }
    add(ColorEffect(Colors.blue, const Offset(0.1, 0.9), EffectController(
        duration: 1.0,
        alternate: true,
        infinite: true,
      )));
    setConditionDecoration();
   // position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);

    add(PolygonHitbox.relative([
      Vector2(-1/10, -1),Vector2(-1/10, 1),Vector2(1/10, 1),Vector2(-1/10, 1)
      ], parentSize: size,isSolid: true));
        }
      case ProjectileStatus.bone:{ 
        power=3;
        life=1;
         final boneSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 514, 194, 12, 12);
       animation = SpriteAnimation.spriteList([boneSprite1], stepTime: 1.0);
            switch(direction){
      case ProjectileDirection.top:
      add(
        MoveEffect.by(Vector2(0, -320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottom:add(
        MoveEffect.by(Vector2(0, 320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.right:
      add(
        MoveEffect.by(Vector2(640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.left:
      add(
        MoveEffect.by(Vector2(-640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRight:
      add(
        MoveEffect.by(Vector2(340,-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topLeft:
      add(
        MoveEffect.by(Vector2.all(-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomRight:
      add(
        MoveEffect.by(Vector2.all(340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomLeft:
      add(
        MoveEffect.by(Vector2(-340,340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.topLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: false,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: false,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: false,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bitmanDirection:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
      add(
        MoveEffect.by((bitmanPosition-position).normalized()*amount, EffectController(
          duration: 1.5,
        ), onComplete: removeFromParent)
          );
      }
          default:
    }
    add(RotateEffect.by(2*pi, EffectController(
      duration: 0.5,
      alternate: false,
      infinite: true
    )));
    setConditionDecoration();
   // position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);

    add(PolygonHitbox.relative([
      Vector2(-1, 1/3),Vector2(-1/3, 1),Vector2(1, -1/3),Vector2(1/3, -1)
      ], parentSize: size,isSolid: true));
      }
    case ProjectileStatus.bug:{
      power=1;
      life=1;
       final bugSprite1 = getSprite(SpriteSheets.monochrome, 96, 256, 16, 16);
       final bugSprite2 = getSprite(SpriteSheets.monochrome, 96, 272, 16, 16);
       animation = SpriteAnimation.spriteList([bugSprite1,bugSprite2], stepTime: 0.2);
            switch(direction){
      case ProjectileDirection.top:
      add(
        MoveEffect.by(Vector2(0, -320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottom:add(
        MoveEffect.by(Vector2(0, 320), EffectController(
          duration: 2.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.right:
      add(
        MoveEffect.by(Vector2(640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.left:
      add(
        MoveEffect.by(Vector2(-640,0), EffectController(
          duration: 4.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRight:
      add(
        MoveEffect.by(Vector2(340,-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topLeft:
      add(
        MoveEffect.by(Vector2.all(-340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomRight:
      add(
        MoveEffect.by(Vector2.all(340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.bottomLeft:
      add(
        MoveEffect.by(Vector2(-340,340), EffectController(
          duration: 3.0
        ),onComplete: removeFromParent)
      );
      case ProjectileDirection.topRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.topLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, -300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomRightCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(400, 0, 200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bottomLeftCurve:
      add(
            MoveAlongPathEffect(
              Path()..quadraticBezierTo(-400, 0, -200, 300),
              EffectController(
                duration: 3.5,
                ),
              oriented: true,
              onComplete: removeFromParent
            ),
          );
      case ProjectileDirection.bitmanDirection:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!
        .position;
      add(
        MoveEffect.by((bitmanPosition-position).normalized()*amount, EffectController(
          duration: 4.5,
        ), onComplete: removeFromParent)
          );
      }
          default:
    }
    add(ColorEffect(Colors.green, const Offset(0.1, 0.9), EffectController(
        duration: 1.0,
        alternate: true,
        infinite: true,
      )));
    setConditionDecoration();
   // position = Vector2(gridPosition.x*16+8, gridPosition.y*16+8);

    add(PolygonHitbox.relative([
      Vector2(-1/3, -2/3),Vector2(1/3, -2/3),Vector2(1/3, 0),Vector2(-1/3, 0)
      ], parentSize: size,isSolid: true));
    }
    }
    
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    if(life<=0){
      add(
        MoveEffect.by(Vector2(0, 330), EffectController(
          duration: 1.0
        ),
        onComplete: removeFromParent),
      );
    }

    if(direction==ProjectileDirection.homing){
      final bitman = findParent<World>()!.firstChild<Bitman>()!;
      //final midPoint = (position+bitman.position)/2;
      if(children.whereType<MoveEffect>().isEmpty){
      add(MoveEffect.to(bitman.position, EffectController(
        duration: Random().nextDouble()+1.0,

      ),onComplete: () => removeAll(children.whereType<MoveEffect>()),));
      }
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
   // removeFromParent();
    super.onCollision(intersectionPoints, other);
  }

}