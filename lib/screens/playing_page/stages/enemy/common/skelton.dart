import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';


enum SkeltonStatus{
  normal,horn,helmet,bug,propeller,parachute,
  normalDead,hornDead,helmetDead,bugDead,propellerDead,parachuteDead,
}
class Skelton extends SpriteAnimationGroupComponent<SkeltonStatus> with StageBlock,EnemyCondition,EnemyHoming,HasGameRef<BitmanQuest> implements Enemy,StageObject{
 Skelton
(double x,double y,{required this.status,required this.interval,this.abnormalStatus = AbnormalStatus.normal}):gridPosition = Vector2(x, y),
  super(size: Vector2.all(16),anchor: Anchor.center);
  
  @override
  final Vector2 gridPosition;

  @override
  final velocity = Vector2.zero();

  @override
  int life = 1;

  @override
  int power = 1;

  @override
  bool isPressable = true;

  @override
  final AbnormalStatus abnormalStatus;

  @override
  bool isAttacked =false;

  final int interval;

  final SkeltonStatus status;

  RaycastResult<ShapeHitbox>? result;

  List<RaycastResult<ShapeHitbox>> results = [];

  bool isHoming = false;

  @override
  FutureOr<void> onLoad() {
    current = status;
    final normalSprite1 = getSprite(SpriteSheets.monochrome, 0, 256.1, 16, 16);
    final normalSprite2 = getSprite(SpriteSheets.monochrome, 16, 256.1, 16, 16);
    final normalSprite3 = getSprite(SpriteSheets.monochrome, 32, 256.1, 16, 16);
    final normalSprite4 = getSprite(SpriteSheets.monochrome, 48, 256.1, 16, 16);
    final normalDeadSprite = getSprite(SpriteSheets.monochrome, 64, 256.1, 16, 16);
    final hornSprite1 = getSprite(SpriteSheets.monochrome, 0, 272.1, 16, 16);
    final hornSprite2 = getSprite(SpriteSheets.monochrome, 16, 272.1, 16, 16);
    final hornSprite3 = getSprite(SpriteSheets.monochrome, 32, 272.1, 16, 16);
    final hornSprite4 = getSprite(SpriteSheets.monochrome, 48, 272.1, 16, 16);
    final hornDeadSprite = getSprite(SpriteSheets.monochrome, 64, 272.1, 16, 16);
    final helmetSprite1 = getSprite(SpriteSheets.monochrome, 0, 288.1, 16, 16);
    final helmetSprite2 = getSprite(SpriteSheets.monochrome, 16, 288.1, 16, 16);
    final helmetSprite3 = getSprite(SpriteSheets.monochrome, 32, 288.1, 16, 16);
    final helmetSprite4 = getSprite(SpriteSheets.monochrome, 48, 288.1, 16, 16);
    final helmetDeadSprite = getSprite(SpriteSheets.monochrome, 80, 288.1, 16, 16);
    final propellerSprite1 = getSprite(SpriteSheets.monochrome, 0, 304.1, 16, 16);
    final propellarSprite2 = getSprite(SpriteSheets.monochrome, 16, 304.1, 16, 16);
    final propellerDeadSprite = getSprite(SpriteSheets.monochrome, 32, 304.1, 16, 16);
    final bugSprite1 = getSprite(SpriteSheets.monochrome, 48, 304.1, 16, 16);
    final bugSprite2 = getSprite(SpriteSheets.monochrome, 64, 304.1, 16, 16);
    final bugDeadSprite = getSprite(SpriteSheets.monochrome, 80, 304.1, 16, 16);
    final parachuteSprite = getSprite(SpriteSheets.monochrome, 96, 304.1, 16, 16);

    animations={
      SkeltonStatus.normal:SpriteAnimation.spriteList([
        normalSprite1,normalSprite2,normalSprite3,normalSprite4
      ], stepTime: 0.2),
      SkeltonStatus.horn:SpriteAnimation.spriteList([
        hornSprite1,hornSprite2,hornSprite3,hornSprite4
      ], stepTime: 0.2),
      SkeltonStatus.helmet:SpriteAnimation.spriteList([
        helmetSprite1,helmetSprite2,helmetSprite3,helmetSprite4
      ], stepTime: 0.2),
      SkeltonStatus.propeller:SpriteAnimation.spriteList([
        propellerSprite1,propellarSprite2
      ], stepTime: 0.1),
      SkeltonStatus.bug:SpriteAnimation.spriteList([
        bugSprite1,bugSprite2
      ], stepTime: 0.1),
      SkeltonStatus.parachute:SpriteAnimation.spriteList([
        parachuteSprite
      ], stepTime: 1.0),
      SkeltonStatus.normalDead:SpriteAnimation.spriteList([
        normalDeadSprite
      ], stepTime: 1.0),
      SkeltonStatus.hornDead:SpriteAnimation.spriteList([
        hornDeadSprite
      ], stepTime: 1.0),
      SkeltonStatus.helmetDead:SpriteAnimation.spriteList([
        helmetDeadSprite
      ], stepTime: 1.0),
      SkeltonStatus.propellerDead:SpriteAnimation.spriteList([
        propellerDeadSprite
      ], stepTime: 1.0),
      SkeltonStatus.bugDead:SpriteAnimation.spriteList([
        bugDeadSprite
      ], stepTime: 1.0),
      SkeltonStatus.parachuteDead:SpriteAnimation.spriteList([
        normalDeadSprite
      ], stepTime: 1.0),
    };
    switch(status){
     case  SkeltonStatus.normal:{
      current = SkeltonStatus.normalDead;
    life=2;
    power=2;
    isPressable = true;
    }
     case SkeltonStatus.horn:{
    life=2;
    power=2;
    isPressable = false;
     }
    case SkeltonStatus.helmet:{
    life=2;
    power=1;
    isPressable = true;
     }
     case SkeltonStatus.propeller:{
    life=1;
    power=2;
    isPressable = true;
     }
      case SkeltonStatus.bug:{
    life=4;
    power=1;
    isPressable = true;
     }
    case SkeltonStatus.parachute:{
    life=3;
    power=1;
    isPressable = true;
     }
     default:
    }

    position = Vector2(gridPosition.x*16 +8, gridPosition.y*16+8);
    add(CircleHitbox(collisionType: CollisionType.passive));
    setConditionDecoration();
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

    //add dynamic effect that depends on Bitman's position
    switch(status){
      case SkeltonStatus.normal:{
        if(children.whereType<MoveEffect>().toList().isEmpty){
        current = SkeltonStatus.normalDead;
        }
        
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if(position.distanceTo(bitmanPosition)<48){
           if(children.whereType<MoveEffect>().toList().isEmpty){
            current = SkeltonStatus.normal;
            add(MoveEffect.by(Vector2(interval*16, 0), EffectController(
              duration: 1.0,
              alternate: true,
              repeatCount: 3
            ),onComplete: ()=>current = SkeltonStatus.normalDead,));

            // if(children.whereType<ColorEffect>().toList().isEmpty){
            //   add(ColorEffect(Colors.red, const Offset(0.0, 1.0), EffectController(
            //   duration: 0.5,
            //   alternate: true,
            //   repeatCount: 6
            // )));
            // }
          }
        }
      } 
      case SkeltonStatus.horn:{
        if(children.whereType<MoveEffect>().toList().isEmpty){
        current = SkeltonStatus.hornDead;
        }
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if(position.distanceTo(bitmanPosition)<48){
           if(children.whereType<MoveEffect>().toList().isEmpty){
            current = SkeltonStatus.horn;
            add(MoveEffect.by(Vector2(interval*16, 0), EffectController(
              duration: 1.0,
              alternate: true,
              repeatCount: 3
            ),onComplete: ()=>current = SkeltonStatus.hornDead,));
          }
        }
      }
      case SkeltonStatus.helmet:{
        if(children.whereType<MoveEffect>().toList().isEmpty){
        current = SkeltonStatus.helmetDead;
        }
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if(position.distanceTo(bitmanPosition)<48){
           if(children.whereType<MoveAlongPathEffect>().toList().isEmpty){
            current = SkeltonStatus.helmet;
            add(MoveAlongPathEffect(
              Path()..addArc(Rect.fromCenter(center:Offset(-16*interval.toDouble()/2, 0), width: 16*interval.toDouble(), height: 16*interval.toDouble()), 0,-pi), EffectController(
              duration: 1.0,
              alternate: true,
              repeatCount: 3
            ),onComplete: ()=>current = SkeltonStatus.helmetDead,));
          }
        }
      }
      case SkeltonStatus.propeller:{
        if(children.whereType<MoveEffect>().toList().isEmpty){
        current = SkeltonStatus.propellerDead;
        }
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if((bitmanPosition.x - position.x).abs()<48){
          if(children.whereType<MoveEffect>().toList().isEmpty){
            current = SkeltonStatus.propeller;
            add(MoveEffect.by(Vector2(interval*16, 0), EffectController(
              duration: 1.0,
              alternate: true,
              repeatCount: 3,
              onMax: () => findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.bottom,abnormalStatus: abnormalStatus)
              ),
              onMin: () => findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.bottom,abnormalStatus: abnormalStatus)
              )
            ),onComplete: (){
               current = SkeltonStatus.propellerDead;
          },));
          }
        }
      }
      case SkeltonStatus.bug:{
        if(children.whereType<MoveEffect>().toList().isEmpty&&!isHoming){
        current = SkeltonStatus.bugDead;
        }
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if((bitmanPosition.x - position.x).abs()<48){
          current = SkeltonStatus.bug;
          isHoming = true;
        }
        if(isHoming) addHomingEffect(wait: 0);
      }
      case SkeltonStatus.parachute:{
        final bitmanPosition = findParent<World>()!.firstChild<Bitman>()!.position;
        if((bitmanPosition.x - position.x).abs()<48){
       
          if(children.whereType<MoveEffect>().toList().isEmpty){
            current = SkeltonStatus.parachute;
            add(MoveEffect.by(Vector2(0, interval*16), EffectController(
              duration: 3.0,
              repeatCount: 1,
              alternate: true,
              onMax: () {
                findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.topLeft,abnormalStatus: abnormalStatus)
              );
                findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.left,abnormalStatus: abnormalStatus)
              );
               findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.topRight,abnormalStatus: abnormalStatus)
              );
                findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.right,abnormalStatus: abnormalStatus)
              );
              },
              onMin: (){ 
                findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.bottomLeft,abnormalStatus: abnormalStatus)
              );
               findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.left,abnormalStatus: abnormalStatus)
              );
               findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.bottomRight,abnormalStatus: abnormalStatus)
              );
               findParent<World>()!.add(
                Projectile.fromPosition(position, status: ProjectileStatus.fireBall, direction:ProjectileDirection.right,abnormalStatus: abnormalStatus)
              );
              }
            ),onComplete: (){
               current = SkeltonStatus.parachuteDead;
          },));
          }
        }
      }
      default:
    }
    
    
    super.update(dt);
  }

//    @override
//   void render(Canvas canvas) {
//     super.render(canvas);
//     Paint paint = Paint()..color = Colors.red.withOpacity(0.6);
//    if(results!=null ){
//     final zoomLevel = findParent<PlayingPage>()!.firstChild<CameraComponent>()!.viewfinder.zoom;
//       final originOffset = (position).toOffset();
//       for(final rst in results!){
//       final intersectionPoint = rst.intersectionPoint!.toOffset();
//       canvas.drawLine(
//         originOffset,
//         intersectionPoint,
//         paint,
//       );
//       }
      
//     }
// }
}