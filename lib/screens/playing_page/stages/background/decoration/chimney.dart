import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/background/decoration/chimney_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';


enum ChimneyDirection{
  horizontal,vertical
}

class Chimney extends PositionComponent implements StageObject{
  Chimney(double x,double y,{required this.length,required this.direction}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final int length;
  final ChimneyDirection direction;

  @override
  FutureOr<void> onLoad() {

    Vector2 nextPosition(int i){
      switch(direction){
        case ChimneyDirection.horizontal:
        return Vector2(gridPosition.x+i, gridPosition.y);
        case ChimneyDirection.vertical:
        return Vector2(gridPosition.x, gridPosition.y+i);
      }
    }
    for(var i=0;i<length;i++){
      final random = Random();
      switch(direction){
        case ChimneyDirection.horizontal:  add(ChimneyBlock(nextPosition(i).x, nextPosition(i).y,
         status:random.nextDouble()<0.9 ? ChimneyBlockStatus.hOne:ChimneyBlockStatus.hOneJoint));
        case ChimneyDirection.vertical:  add(ChimneyBlock(nextPosition(i).x, nextPosition(i).y,
         status:random.nextDouble()<0.9 ? ChimneyBlockStatus.vOne:ChimneyBlockStatus.vOneJoint));
      }
    }
    
    return super.onLoad();
  }

}