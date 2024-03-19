import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/goal_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';


class Ride extends SpriteGroupComponent<BitmanRide> 
with StageBlock,CollisionCallbacks implements StageObject,Ridable{
  Ride(double x,double y,{required this.status}):gridPosition=Vector2(x, y),
  super(size: Vector2.all(32),anchor: Anchor.center);

  @override
  final Vector2 gridPosition;

  final BitmanRide status;

  bool isRide = false;

  bool hitWall = false;

  bool addColor = false;

  @override
  final velocity = Vector2.zero();


  @override
  FutureOr<void> onLoad() {
    current = status;
    final sattelliteSprite=getSprite(SpriteSheets.coloredTransparentPacked, 641, 33, 14, 14);
    sprites={
      BitmanRide.sattellite:sattelliteSprite
    };
    position = Vector2(gridPosition.x*16+16, gridPosition.y*16+16);
    //final bitman = findParent<World>()!.firstChild<Bitman>()!;
   // priority = bitman.priority+1;
    // add(PolygonHitbox.relative([
    //      Vector2(-1, 0),Vector2(1, 0),Vector2(1, 1),Vector2(-1, 1)
    //      ], parentSize: size));
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    velocity.x = findParent<PlayingPage>()!.state.objectSpeed;
    velocity.y=0;
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    final joystick = bitman.joystick;

    if(position.distanceTo(bitman.position)>32) isRide = false;
    if(isRide ){
      bitman.ride = status;
     // angle = -joystick.relativeDelta.angleToSigned(Vector2(0, -1));
      switch(joystick.direction){
      case JoystickDirection.idle:
      velocity.x = 0;
      velocity.y=0;
      case JoystickDirection.up:
      velocity.y=40* joystick.relativeDelta.y;
      case JoystickDirection.upLeft:
       velocity.x+= bitman.maxSpeed * joystick.relativeDelta.x;
      velocity.y=20* joystick.relativeDelta.y;
      bitman.velocity.y=20* joystick.relativeDelta.y;
      case JoystickDirection.upRight:
      velocity.x+= bitman.maxSpeed * joystick.relativeDelta.x;
      velocity.y=20* joystick.relativeDelta.y;
      bitman.velocity.y=20* joystick.relativeDelta.y;
      case JoystickDirection.left:
      velocity.x+=bitman.maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.right:
      velocity.x+= bitman.maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.down:{
      velocity.y=40* joystick.relativeDelta.y;
      if(findParent<World>()!.children.whereType<Platform>().where((block) => block.position.distanceTo(position)<64).isNotEmpty){
        velocity.y=0;
      }
      }
      case JoystickDirection.downLeft:
      velocity.x+= bitman.maxSpeed * joystick.relativeDelta.x;
      velocity.y=20* joystick.relativeDelta.y;
      bitman.velocity.y=20* joystick.relativeDelta.y;
      case JoystickDirection.downRight:
      velocity.y=20* joystick.relativeDelta.y;
      bitman.velocity.y=20* joystick.relativeDelta.y;
      velocity.x+= bitman.maxSpeed * joystick.relativeDelta.x;
    }
    if(!addColor){
      addColor = true;
    add(ColorEffect(Colors.blue,const Offset(0.1, 1.0), EffectController(
      duration: 1.5,
      alternate: true,
      infinite: true
    )));
    add(RotateEffect.by(2*pi, EffectController(
      duration: 0.5,
      infinite: true
    )));
    }
    }else{
      velocity.x = findParent<PlayingPage>()!.state.objectSpeed;
      velocity.y = 0;
      
      removeAll(children.whereType<ColorEffect>());
      removeAll(children.whereType<RotateEffect>());
      addColor = false;
    }

   position +=  velocity * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {

    final bitman = findParent<World>()!.firstChild<Bitman>()!;
   if(other is Bitman && bitman.isOnGround){
    isRide=true;
   }
   if(other is Ridable){
    velocity.x=0;
    velocity.y=0;
    //方向によってhitWallをもっとバラエティを持たせたい
    //hitWall = true;

    if(intersectionPoints.length==2){
        final mid = (intersectionPoints.elementAt(0)+intersectionPoints.elementAt(1))/2;
        final collisionNormal = absoluteCenter - mid;
        final seperationDistance = (size.x/2) - collisionNormal.length;
        collisionNormal.normalize();
       
        position += collisionNormal.scaled(seperationDistance);
      }
    }
    super.onCollision(intersectionPoints, other);
   }
  }
  // @override
  // void (Set<Vector2> intersectionPoints, PositionComponent other) {
  //  final bitman = findParent<World>()!.firstChild<Bitman>()!;
  //  if(other is Bitman && bitman.isOnGround){
  //   isRide=true;
  //  }
  //   super.onCollisionStart(intersectionPoints, other);
  // }
