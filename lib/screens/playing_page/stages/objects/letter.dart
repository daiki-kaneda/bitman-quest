
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ridable.dart';
import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

enum LetterStatus{
  dig0,dig1,dig2,dig3,dig4,dig5,dig6,dig7,dig8,dig9,
  add,sub,mul,div,eq,vEq,period,bang,question,greaterThan,lessThan,
  percent,letX,letY,letZ,rArrow,lArrow,tArrow,bArrow,o,x,lParen,rParen,tParren,bParren,undo
}

class LetterTile extends SpriteComponent with StageBlock implements StageObject,HasPathEffect,Ridable{
  LetterTile(double x,double y,{required this.status,this.letterSize=16,
  this.path,this.pathAlternate=true,this.pathDuration=2.5}):
  gridPosition = Vector2(x, y),
  super(size: Vector2.all(16));

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity=Vector2.zero();

  @override
  Path? path;

  @override
  final double pathDuration;

  @override
  final bool pathAlternate;

  final LetterStatus status;

  final double letterSize;
  
  @override
  FutureOr<void> onLoad() {
    position=Vector2(gridPosition.x*16,gridPosition.y*16);
    size = Vector2.all(letterSize);
    switch(status){
      case LetterStatus.dig0:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 35*16, 17*16,16, 16);
      case LetterStatus.dig1:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 36*16, 17*16,16, 16);
      case LetterStatus.dig2:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 37*16, 17*16,16, 16);
      case LetterStatus.dig3:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 38*16, 17*16,16, 16);
      case LetterStatus.dig4:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 17*16,16, 16);
      case LetterStatus.dig5:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 40*16, 17*16,16, 16);
      case LetterStatus.dig6:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 41*16, 17*16,16, 16);
      case LetterStatus.dig7:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 42*16, 17*16,16, 16);
      case LetterStatus.dig8:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 43*16, 17*16,16, 16);
      case LetterStatus.dig9:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 44*16, 17*16,16, 16);
      case LetterStatus.add:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 36*16, 20*16,16, 16);
      case LetterStatus.sub:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 37*16, 20*16,16, 16);
      case LetterStatus.mul:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 38*16, 20*16,16, 16);
      case LetterStatus.div:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 20*16,16, 16);
      case LetterStatus.eq:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 40*16, 20*16,16, 16);
      case LetterStatus.vEq:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 40*16, 20*16,16, 16);
      anchor = Anchor.center;
      angle=pi/2;
      position=position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.period:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 46*16, 17*16,16, 16);
      case LetterStatus.bang:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 35*16, 13*16,16, 16);
      case LetterStatus.question:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 37*16, 13*16,16, 16);
      case LetterStatus.greaterThan:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 24*16, 20*16,16, 16);
      case LetterStatus.lessThan:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 26*16, 20*16,16, 16);
      case LetterStatus.percent:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 47*16, 17*16,16, 16);
      case LetterStatus.letX:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 45*16, 19*16,16, 16);
      case LetterStatus.letY:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 46*16, 19*16,16, 16);
      case LetterStatus.letZ:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 47*16, 19*16,16, 16);
      case LetterStatus.tArrow:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 24*16, 12*16,16, 16);
      case LetterStatus.bArrow:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 24*16, 12*16,16, 16);
      anchor = Anchor.center;
      scale=Vector2(1, -1);
      position=position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.rArrow:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 24*16, 12*16,16, 16);
      anchor = Anchor.center;
      angle=pi/2;
      position=position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.lArrow:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 24*16, 12*16,16, 16);
      anchor = Anchor.center;
      angle=-pi/2;
      position=position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.o:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 13*16,16, 16);
      case LetterStatus.x:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 40*16, 13*16,16, 16);
      case LetterStatus.rParen:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 13*16,10, 16);
      size=Vector2(14, 16);
      case LetterStatus.lParen:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 13*16,10, 16);
      anchor = Anchor.center;
      scale=Vector2(-1, 1);
      size=Vector2(14, 16);
      position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.tParren:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 13*16,8, 16);
      anchor = Anchor.center;
      angle = pi/2;
      size=Vector2(16, 14);
      position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.bParren:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked, 39*16, 13*16,8, 16);
      anchor = Anchor.center;
      angle = -pi/2;
      size=Vector2(16, 14);
      position=Vector2(gridPosition.x*16 +8,gridPosition.y*16 +8);
      case LetterStatus.undo:
      sprite=getSprite(SpriteSheets.coloredTransparentPacked,352, 320,16, 16);
    }
    if(path!=null){
      add(MoveAlongPathEffect(path!, EffectController(
        duration: pathDuration,
        alternate: pathAlternate,
        infinite: true,
      )));
    }
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }

  @override
  void onRemove() {
    //resetPosition();
    super.onRemove();
  }

  factory LetterTile.fromChar(double x,double y,{required String char}){
    LetterStatus status;
    switch(char){
        case '0':
        status = LetterStatus.dig0;
        case '1':
        status = LetterStatus.dig1;
        case '2':
         status = LetterStatus.dig2;
        case '3':
         status = LetterStatus.dig3;
        case '4':
         status = LetterStatus.dig4;
        case '5':
         status = LetterStatus.dig5;
        case '6':
         status=LetterStatus.dig6;
        case '7':
         status=LetterStatus.dig7;
        case '8':
         status=LetterStatus.dig8;
        case '9':
         status=LetterStatus.dig9;
        case '+':
         status=LetterStatus.add;
        case '-':
         status=LetterStatus.sub;
        case '*':
         status=LetterStatus.mul;
        case '/':
         status=LetterStatus.div;
        case '=':
         status=LetterStatus.eq;
        case '~': //vertical equal
         status=LetterStatus.vEq;
        case '.':
         status=LetterStatus.period;
        case '!':
        status=LetterStatus.bang;
        case '?':
        status=LetterStatus.question;
        case '>':
        status=LetterStatus.greaterThan;
        case '<':
        status=LetterStatus.lessThan;
        case '%':
        status=LetterStatus.percent;
        case 'X':
        status=LetterStatus.letX;
        case 'Y':
        status=LetterStatus.letY;
        case 'Z':
        status=LetterStatus.letZ;
        case '→':
        status=LetterStatus.rArrow;
        case '↓':
        status=LetterStatus.bArrow;
        case '←':
        status=LetterStatus.lArrow;
        case '↑':
        status=LetterStatus.tArrow;
        case 'o':
        status=LetterStatus.o;
        case 'x':
        status=LetterStatus.x;
        case '(': 
         status=LetterStatus.rParen;
        case ')': 
         status=LetterStatus.lParen;
        case '{':  //top paren
         status=LetterStatus.tParren;
         case '}':  //bottom paren
         status=LetterStatus.bParren;
         case 'u':
         status = LetterStatus.undo;
        default :
         status=LetterStatus.dig0;
        
    }
    return LetterTile(x, y, status: status);
  }
}