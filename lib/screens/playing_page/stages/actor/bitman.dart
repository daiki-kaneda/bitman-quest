
import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/arms/helmet.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/arms/weapon.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/condition_decoration/condition_decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/heal_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/helmet_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/power_up_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/transform_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/weapon_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/border.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/end_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/goal_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/input_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/locked_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/spring.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/start_position.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';


enum BitmanStatus{
  normal,walking,jumping,dead,
  yellowNormal,yellowWalking,yellowJumping,yellowDead,
  greenNormal,greenWalking,greenJumping,greenDead
}
enum BitmanColor{
  normalBlue,speedYellow,floatGreen
}
enum AbnormalStatus{
  normal,poison,stun,healing
}
enum BitmanWeapon{
  none,shovel,pick,sword,gun,arrow,bomb,dynamite
}
enum BitmanHelmet{
  none,hardHat,helmet,armor
}
enum BitmanRide{
  none,sattellite
}

class Bitman extends SpriteAnimationGroupComponent<BitmanStatus> with HasGameRef<BitmanQuest>,CollisionCallbacks{
  Bitman({required this.joystick}):super(size: Vector2.all(24),anchor: Anchor.center);

  final Vector2 velocity = Vector2.zero();
  final JoystickComponent joystick;


  //properties
  int maxSpeed = 100; //100
  int gravity = 200; //200
  final terminalVelocity = 40;
  final jumpSpeed = 130.0; //130
  bool isOnGround = false;
  bool hitEnemy = false;
  bool attacked = false;
  bool isPressEnemy = false;
  int jumpCount = 0;
  BitmanWeapon weapon = BitmanWeapon.none;
  BitmanHelmet helmet = BitmanHelmet.none;
  BitmanRide ride = BitmanRide.none;
  BitmanColor bitmanColor = BitmanColor.normalBlue;
  AbnormalStatus condition = AbnormalStatus.normal;
  bool hasHelmet = false;
  final fromAbove = Vector2(0, -1);
  final fromBelow = Vector2(0, 1);


  @override
  FutureOr<void> onLoad() {
    final bitmanSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 18*16, 7*16+1, 16, 16);
    final bitmanSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 19*16, 7*16+1, 16, 16);
    final bitmanSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 20*16, 7*16, 16, 16);
    final bitmanSprite4 = getSprite(SpriteSheets.coloredTransparentPacked, 21*16, 7*16, 16, 16);
    final bitmanSprite5 = getSprite(SpriteSheets.coloredTransparentPacked, 22*16, 7*16, 16, 16);
    final bitmanSprite6 = getSprite(SpriteSheets.coloredTransparentPacked, 23*16, 7*16, 16, 16);
    final normal = SpriteAnimation.spriteList([bitmanSprite1], stepTime: 0.1);
    final walking = SpriteAnimation.variableSpriteList([bitmanSprite1,bitmanSprite2,bitmanSprite3], stepTimes: [0.2,0.1,0.3]);
    final jumping = SpriteAnimation.spriteList([bitmanSprite4,bitmanSprite5], stepTime: 0.3);
    final dead = SpriteAnimation.spriteList([bitmanSprite6], stepTime: 0.1);

    final yellowBitmanSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 18*16, 8*16+1, 16, 16);
    final yellowBitmanSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 19*16, 8*16+1, 16, 16);
    final yellowBitmanSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 20*16, 8*16, 16, 16);
    final yellowBitmanSprite4 = getSprite(SpriteSheets.coloredTransparentPacked, 21*16, 8*16, 16, 16);
    final yellowBitmanSprite5 = getSprite(SpriteSheets.coloredTransparentPacked, 22*16, 8*16, 16, 16);
    final yellowBitmanSprite6 = getSprite(SpriteSheets.coloredTransparentPacked, 23*16, 8*16, 16, 16);
    final yellowNormal = SpriteAnimation.spriteList([yellowBitmanSprite1], stepTime: 0.1);
    final yellowWalking = SpriteAnimation.variableSpriteList([yellowBitmanSprite1,yellowBitmanSprite2,yellowBitmanSprite3], stepTimes: [0.2,0.1,0.3]);
    final yellowJumping = SpriteAnimation.spriteList([yellowBitmanSprite4,yellowBitmanSprite5], stepTime: 0.3);
    final yellowDead = SpriteAnimation.spriteList([yellowBitmanSprite6], stepTime: 0.1);

    final greenBitmanSprite1 = getSprite(SpriteSheets.coloredTransparentPacked, 18*16, 9*16+1, 16, 16);
    final greenBitmanSprite2 = getSprite(SpriteSheets.coloredTransparentPacked, 19*16, 9*16+1, 16, 16);
    final greenBitmanSprite3 = getSprite(SpriteSheets.coloredTransparentPacked, 20*16, 9*16, 16, 16);
    final greenBitmanSprite4 = getSprite(SpriteSheets.coloredTransparentPacked, 21*16, 9*16, 16, 16);
    final greenBitmanSprite5 = getSprite(SpriteSheets.coloredTransparentPacked, 22*16, 9*16, 16, 16);
    final greenBitmanSprite6 = getSprite(SpriteSheets.coloredTransparentPacked, 23*16, 9*16, 16, 16);
    final greenNormal = SpriteAnimation.spriteList([greenBitmanSprite1], stepTime: 0.1);
    final greenWalking = SpriteAnimation.variableSpriteList([greenBitmanSprite1,greenBitmanSprite2,greenBitmanSprite3], stepTimes: [0.2,0.1,0.3]);
    final greenJumping = SpriteAnimation.spriteList([greenBitmanSprite4,greenBitmanSprite5], stepTime: 0.3);
    final greenDead = SpriteAnimation.spriteList([greenBitmanSprite6], stepTime: 0.1);
    animations = {
      BitmanStatus.normal:normal,
      BitmanStatus.walking:walking,
      BitmanStatus.jumping:jumping,
      BitmanStatus.dead:dead,
      BitmanStatus.yellowNormal:yellowNormal,
      BitmanStatus.yellowWalking:yellowWalking,
      BitmanStatus.yellowJumping:yellowJumping,
      BitmanStatus.yellowDead:yellowDead,
      BitmanStatus.greenNormal:greenNormal,
      BitmanStatus.greenWalking:greenWalking,
      BitmanStatus.greenJumping:greenJumping,
      BitmanStatus.greenDead:greenDead,
    };
    current = BitmanStatus.normal;

    add(CircleHitbox());
    final weaponComponent = Weapon();
    final helmetComponent = Helmet();
    final conditionDecoration = ConditionDecoration();
    (parent as World).add(weaponComponent);
    (parent as World).add(helmetComponent);
    (parent as World).add(conditionDecoration);
    return super.onLoad();
  }

  

  @override
  Future<void> onCollision(Set<Vector2> intersectionPoints, PositionComponent other)async {
    if(other is Ridable){
      if(intersectionPoints.length>=2){
        final mid = (intersectionPoints.elementAt(0)+intersectionPoints.elementAt(1))/2;
        final collisionNormal = absoluteCenter - mid;
        final seperationDistance = (size.x/2) - collisionNormal.length;
        collisionNormal.normalize();
        //bitmanがほとんど真上からブロックに衝突する場合
        if(fromAbove.dot(collisionNormal)>0.9){
          isOnGround = true;
          //reset jumpCount
          jumpCount=0;

          //fall fallable platform
          if (other is PlatformBlock &&
              other.status == PlatformStatus.fallable) {
            other.add(
              MoveEffect.by(Vector2(0, 330), EffectController(
                duration: 5.0,
                startDelay: 0.5,
                ),
                  onComplete:other.removeFromParent),
            );
          }
        }
        //bitmanがほとんど真下からブロックに衝突する場合
        if(fromBelow.dot(collisionNormal)>0.9){
          if(other is InputBlockBorder){
             final solved =  other.findParent<Problem>()!.status == ProblemStatus.success;
            if(!other.inputting && !solved){
              other.inputting=true;
              final signal = (other.parent as InputBlock).inputText;
              if(signal == 'u'){
                other.findParent<Problem>()!.inputText='';
              other.add(ColorEffect(
                Colors.red,
                const Offset(0.8, 0.0),
                  EffectController(
                    duration: 1.0
                  ),
                  onComplete: () => other.inputting =false,
                ));
              }else{
                other.findParent<Problem>()!.inputText+=signal;
              other.add(ColorEffect(
                Colors.blue,
                const Offset(0.8, 0.0),
                  EffectController(
                    duration: 1.0
                  ),
                  onComplete: () => other.inputting =false,
                ));
              }
            }
           
          }
        }
        position += collisionNormal.scaled(seperationDistance);
      }
    }

    if(other is GoalBlock){
      //ボーナスステージからゴールした場合にステージインデックスを戻す
      game.state = game.state.copyWith(
            stageSelected: other.stageIndex
          );
      game.router.pushReplacementNamed('finish-dialog');
      if(game.userData.progress.lastClearedStage()<other.stageIndex){
        game.userData.progress.update(other.stageIndex,isCleared: true);
        await game.savedata.saveUserData(game.userData);
      }
    }

    if(other is Enemy){
      print(other.abnormalStatus);
      if(other.isPressable){
      if(intersectionPoints.length ==2){
      final mid = (intersectionPoints.elementAt(0)+intersectionPoints.elementAt(1))/2;
        final collisionNormal = absoluteCenter - mid;
        collisionNormal.normalize();
        //bitmanがほとんど真上からEnemyに衝突する場合
        if(fromAbove.dot(collisionNormal)>0.8){
            
          if(!isPressEnemy){
        isPressEnemy = true;
         other.life -= 1;
          
         other.add(
          OpacityEffect.fadeOut(
          EffectController(
            duration: 0.2,
            alternate: true,
            repeatCount: 2
          )
        ,onComplete:()=> isPressEnemy=false),);
         velocity.y = -jumpSpeed;
          }
         return;
        }
      }
      }

      if(!hitEnemy){
      if(hasHelmet){
         hitEnemy = true;
         if(other.power>0){
        findParent<World>()!.firstChild<Helmet>()!.durability -= other.power;
        findParent<World>()!.firstChild<Helmet>()!.
          add(
          OpacityEffect.fadeOut(
          EffectController(
            duration: 0.2,
            alternate: true,
            repeatCount: 5
          ),
          onComplete: ()=>hitEnemy=false
        ));
         }
      }else{
        hitEnemy = true;
        condition = other.abnormalStatus;
        if(other.power>0){
        findParent<PlayingPage>()!.state.lives -= other.power;
        add(
          OpacityEffect.fadeOut(
          EffectController(
            duration: 0.2,
            alternate: true,
            repeatCount: 5
          ),
          onComplete: ()=>hitEnemy=false
        ));
        }
      }
      }
    }

    if(other is Spring){
      other.playing = true;
      velocity.y = -jumpSpeed*2;
      other.add(ColorEffect(Colors.red, Offset.zero, EffectController(
        duration: 0.3
      ),onComplete: () => other.playing = false,));
    }

    if (other is StageItem) {
      if (other is HealItem) {
        if(findParent<PlayingPage>()!.state.lives<6){
        findParent<PlayingPage>()!.state.lives += other.healing;
        findParent<PlayingPage>()!.state.lives=findParent<PlayingPage>()!.state.lives.clamp(0, 6);
        condition = AbnormalStatus.healing;
        other.removeFromParent();
        }
      }
      if (other is WeaponItem) {
        if(weapon!=other.status){
        weapon = other.status;
        other.removeFromParent();
        }
      }
      if (other is HelmetItem) {
        helmet = other.status;
        (parent as World).firstChild<Helmet>()!.setDurability(other.status);
        other.removeFromParent();
      }
      if (other is PowerUpItem) {
        switch (other.status) {
          case PowerUpItemStatus.speedUp:{
            maxSpeed += 100;
            other.removeFromParent();
          }
        }
      }
      if (other is TransformItem) {
       if(bitmanColor!=other.status){
        bitmanColor = other.status;
        switch(other.status){
          case BitmanColor.normalBlue:{
          }
          case BitmanColor.speedYellow:{
            //speed up
            maxSpeed = 150;
            add(SequenceEffect([
          OpacityEffect.to(1.0, 
          EffectController(
            duration: 15
          )),
          OpacityEffect.fadeOut(EffectController(
            duration: 0.3,
            alternate: true,
            repeatCount: 3
          ))
        ],onComplete: () {
          //reset speed
          maxSpeed = 100;
          bitmanColor = BitmanColor.normalBlue;
        }),);
          }
          case BitmanColor.floatGreen:{
             //reduce gravity
            gravity = 100;
            add(SequenceEffect([
          OpacityEffect.to(1.0, 
          EffectController(
            duration: 15
          )),
          OpacityEffect.fadeOut(EffectController(
            duration: 0.3,
            alternate: true,
            repeatCount: 3
          ))
        ],onComplete: () {
          //reset gravity
          gravity = 200;
          bitmanColor = BitmanColor.normalBlue;
        }),);
          }
        }
        other.removeFromParent();
        }
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    //gameover logic
    if(position.y>game.canvasSize.y) findParent<PlayingPage>()!.state.fallDown = true;

    //horizontal move logic
    flip(joystick.direction);
    switch(bitmanColor){
      case BitmanColor.normalBlue:{
        switch(joystick.direction){
      case JoystickDirection.idle:
      current = BitmanStatus.normal;
      velocity.x = 0;
      case JoystickDirection.up:current = BitmanStatus.jumping;
      case JoystickDirection.upLeft:current = BitmanStatus.jumping;
      case JoystickDirection.upRight:current = BitmanStatus.jumping;
      case JoystickDirection.left:
      current = BitmanStatus.walking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.right:
      current = BitmanStatus.walking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.down:current = BitmanStatus.jumping;
      case JoystickDirection.downLeft:current = BitmanStatus.jumping;
      case JoystickDirection.downRight:current = BitmanStatus.jumping;
    }
      }
      case BitmanColor.speedYellow:{
        switch(joystick.direction){
      case JoystickDirection.idle:
      current = BitmanStatus.yellowNormal;
      velocity.x = 0;
      case JoystickDirection.up:current = BitmanStatus.yellowJumping;
      case JoystickDirection.upLeft:current = BitmanStatus.yellowJumping;
      case JoystickDirection.upRight:current = BitmanStatus.yellowJumping;
      case JoystickDirection.left:
      current = BitmanStatus.yellowWalking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.right:
      current = BitmanStatus.yellowWalking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.down:current = BitmanStatus.yellowJumping;
      case JoystickDirection.downLeft:current = BitmanStatus.yellowJumping;
      case JoystickDirection.downRight:current = BitmanStatus.yellowJumping;
    }
      }
      case BitmanColor.floatGreen:{
        switch(joystick.direction){
      case JoystickDirection.idle:
      current = BitmanStatus.greenNormal;
      velocity.x = 0;
      case JoystickDirection.up:current = BitmanStatus.greenJumping;
      case JoystickDirection.upLeft:current = BitmanStatus.greenJumping;
      case JoystickDirection.upRight:current = BitmanStatus.greenJumping;
      case JoystickDirection.left:
      current = BitmanStatus.greenWalking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.right:
      current = BitmanStatus.greenWalking;
      velocity.x = maxSpeed * joystick.relativeDelta.x;
      case JoystickDirection.down:current = BitmanStatus.greenJumping;
      case JoystickDirection.downLeft:current = BitmanStatus.greenJumping;
      case JoystickDirection.downRight:current = BitmanStatus.greenJumping;
    }
      }
    }
    

    //vertical logic
    if(isOnGround && 
      activeCollisions.whereType<Ridable>().toList().isNotEmpty){
      velocity.y=5;
    }else{
    velocity.y += gravity*dt;
    velocity.y.clamp(-jumpSpeed, terminalVelocity);
    }

    //scrolling logic
    findParent<PlayingPage>()!.state.objectSpeed = 0;
    final viewPortWidth = findParent<PlayingPage>()!.firstChild<CameraComponent>()!.visibleWorldRect.width;
    if(position.x>viewPortWidth/2+30){
      //bitmanの位置を取得するブロックを作って,左方向のスクロールも実現したい
      if(joystick.relativeDelta.x>0){
        if(findParent<World>()!.firstChild<EndPosition>()!.position.x>=viewPortWidth){
        velocity.x = 0;
        findParent<PlayingPage>()!.state.objectSpeed = -maxSpeed * joystick.relativeDelta.x;
        }
      }
    }
    if( position.x<viewPortWidth/2+60){
      if(joystick.relativeDelta.x<0){
        if(findParent<World>()!.firstChild<StartPosition>()!.position.x<=0){
          velocity.x = 0;
        findParent<PlayingPage>()!.state.objectSpeed = -maxSpeed * joystick.relativeDelta.x;
        }
      }
    }
      
    if(position.x-16<0 && joystick.relativeDelta.x<0){
      velocity.x = 0;
    }
    if(position.y+8<0 && !isOnGround){
      velocity.y = terminalVelocity.toDouble();
    }
    position += velocity * dt;

    super.update(dt);
  }


  //util
  void flip(JoystickDirection direction){
    if(direction == JoystickDirection.left && scale.x>0){
      flipHorizontally();
    }
    if(direction == JoystickDirection.right && scale.x<0){
      flipHorizontally();
    }
  }

  
  
}