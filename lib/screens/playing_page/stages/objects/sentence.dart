
import 'dart:async';
import 'dart:ui';

import 'package:bitman_quest/screens/playing_page/stages/has_path_effect.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

enum SentenceDirection{
  horizontal,vertical,upward,downward
}

class Sentence extends PositionComponent implements StageObject,HasPathEffect{
  Sentence(double x,double y,{required this.str,required this.direction,this.letterSize=16,
  this.path,this.pathAlternate=true,this.pathDuration=2.5}):gridPosition=Vector2(x, y);

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

  final String str;
  final SentenceDirection direction;

  final double letterSize;

  @override
  FutureOr<void> onLoad() {

    Vector2 nextPosition(int i){
      switch(direction){
        case SentenceDirection.horizontal:
        return Vector2(gridPosition.x+i, gridPosition.y);
        case SentenceDirection.vertical:
        return Vector2(gridPosition.x, gridPosition.y+i);
        case SentenceDirection.upward:
        return Vector2(gridPosition.x+i, gridPosition.y-i);
        case SentenceDirection.downward:
        return Vector2(gridPosition.x+i, gridPosition.y+i);
      }
    }
    for(var i=0;i<str.length;i++){
      switch(str[i]){
        case '0':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig0,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '1':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig1,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '2':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig2,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '3':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig3,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '4':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig4,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '5':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig5,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '6':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig6,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '7':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig7,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '8':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig8,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '9':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.dig9,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '+':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.add,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '-':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.sub,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '*':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.mul,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '/':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.div,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '=':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.eq,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '~': //vertical equal
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.vEq,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '.':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.period,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '!':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.bang,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '?':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.question,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '>':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.greaterThan,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '<':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.lessThan,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '%':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.percent,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case 'X':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.letX,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case 'Y':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.letY,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case 'Z':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.letZ,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '→':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.rArrow,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '↓':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.bArrow,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '←':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.lArrow,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '↑':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.tArrow,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case 'o':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.o,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case 'x':
        add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.x,letterSize: letterSize,
        path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '(': 
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.rParen,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case ')': 
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.lParen,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        case '{':  //top paren
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.tParren,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
         case '}':  //bottom paren
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.bParren,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
         case 'u':
         add(LetterTile(nextPosition(i).x, nextPosition(i).y, status: LetterStatus.undo,letterSize: letterSize,
         path: path,pathAlternate: pathAlternate,pathDuration: pathDuration));
        default :

      }
    }

    return super.onLoad();
  }
  factory Sentence.fromPosition(Vector2 position,{required String str,required SentenceDirection direction}){
      return Sentence(0, 0, str: str, direction: direction)
      ..children.map((tile){
        if(tile is PositionComponent){
          return tile..position += position;
        }else{
          return tile;
        }
      } ).toList();
    }

}

