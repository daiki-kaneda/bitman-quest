import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

enum GroundsDirection{
  horizontal,vertical,upward,downward
}

class Grounds extends PositionComponent implements StageObject{
  Grounds(double x,double y,{required this.str,required this.direction,this.isSolid = true}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final String str;
  final GroundsDirection direction;
  bool isSolid;

  @override
  FutureOr<void> onLoad() {

    Vector2 nextPosition(int i){
      switch(direction){
        case GroundsDirection.horizontal:
        return Vector2(gridPosition.x+i, gridPosition.y);
        case GroundsDirection.vertical:
        return Vector2(gridPosition.x, gridPosition.y+i);
        case GroundsDirection.upward:
        return Vector2(gridPosition.x+i, gridPosition.y-i);
        case GroundsDirection.downward:
        return Vector2(gridPosition.x+i, gridPosition.y+i);
      }
    }
//     enum GroundStatus{
//   top,bottom,right,left,trCr,tlCr,brCr,blCr,trJt,tlJt,brJt,blJt,trSlope,tlSlope,brSlope,blSlope,deco
// }
    for(var i=0;i<str.length;i++){
      switch(str[i]){
        case 'n':
        add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.normal,isSolid: isSolid));
        case 't':
        add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.top,isSolid: isSolid));
        case 'b':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.bottom,isSolid: isSolid));
        case 'r':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status:GroundStatus.right,isSolid: isSolid));
        case 'l':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.left,isSolid: isSolid));
        case 'd':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.deco,isSolid: isSolid));
        case ']':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.trCr,isSolid: isSolid));
        case '[':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.tlCr,isSolid: isSolid));
        case '}':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.brCr,isSolid: isSolid));
        case '{':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.blCr,isSolid: isSolid));
        case '>':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.trJt,isSolid: isSolid));
        case '<':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.tlJt,isSolid: isSolid));
        case ')':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.brJt,isSolid: isSolid));
        case '(':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.blJt,isSolid: isSolid));
        case 'x':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.trSlope,isSolid: isSolid));
        case 'y':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.tlSlope,isSolid: isSolid));
        case 'z':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.brSlope,isSolid: isSolid));
        case 'w':
         add(GroundBlock(nextPosition(i).x, nextPosition(i).y, status: GroundStatus.blSlope,isSolid: isSolid));
        default :

      }
    }
    return super.onLoad();
  }

}