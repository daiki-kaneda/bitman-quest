import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/block/breakable_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/mass_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/decoration/cord_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';


class Cords extends PositionComponent implements StageObject{
  Cords(double x,double y,{required this.w,required this.h,required this.status}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  final int w;
  final int h;

  final CordBlockStatus status;

  @override
  FutureOr<void> onLoad() {
    for(var i=0;i<w;i++){
      for(var j=0;j<h;j++){
        add(CordBlock(gridPosition.x+i, gridPosition.y+j,status: status));
      }
      }
    return super.onLoad();
  }

}