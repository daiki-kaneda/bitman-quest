import 'dart:async';
import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/grounds.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';



enum GrndStatus{
  leftCorner,flat,rightCorner,uSlope,dSlope,rectangle,invertedRect,deco,floatingRect
}
class Grnd extends PositionComponent{
  Grnd({required this.status,required this.gridPoints,this.isSolid=true});

  final List<Vector2> gridPoints;
  final GrndStatus status;
  bool isSolid;


  @override
  FutureOr<void> onLoad() {
    if(gridPoints.length==2){
      switch(status){
        case GrndStatus.flat:
        add(Grounds(gridPoints[0].x,gridPoints[0].y, str: 't'*(gridPoints[1].x-gridPoints[0].x +1).toInt(), direction: GroundsDirection.horizontal,
        isSolid: isSolid));
        case GrndStatus.uSlope:{
        add(Grounds(gridPoints[0].x,gridPoints[0].y, str: 'y'*(gridPoints[1].x-gridPoints[0].x +1).toInt(), direction: GroundsDirection.upward,
        isSolid: false));
        add(Grounds(gridPoints[0].x,gridPoints[0].y+1, str: '<'*(gridPoints[1].x-gridPoints[0].x +1).toInt(), direction: GroundsDirection.upward,
        isSolid: isSolid));
        for(double i=0;i<gridPoints[1].x-gridPoints[0].x+1;i++){
        add(Grounds(gridPoints[0].x+i,gridPoints[0].y+2-i, str: 'n'*(gridPoints[1].y).toInt(), direction: GroundsDirection.vertical));
        }
        }

        case GrndStatus.dSlope:{
        add(Grounds(gridPoints[0].x,gridPoints[0].y, str: 'x'*(gridPoints[1].x-gridPoints[0].x +1).toInt(), direction: GroundsDirection.downward,
        isSolid: false));
        add(Grounds(gridPoints[0].x,gridPoints[0].y+1, str: '>'*(gridPoints[1].x-gridPoints[0].x ).toInt(), direction: GroundsDirection.downward,
        isSolid: isSolid));
        for(double i=0;i<gridPoints[1].x-gridPoints[0].x+1;i++){
        add(Grounds(gridPoints[0].x+i,gridPoints[0].y+2+i, str: 'n'*(gridPoints[0].y).toInt(), direction: GroundsDirection.vertical));
        }
        }
        case GrndStatus.deco:{
        //指定した長方形(左上の原点と幅と高さのベクトルで指定する)内にランダムにデコレーションを配置する
        final random = Random();
        for(var i=0;i<gridPoints[1].x;i++){
          for(var j=0;j<gridPoints[1].y;j++){
            if(random.nextDouble()>0.92){
            add( GroundBlock(gridPoints[0].x+i, gridPoints[0].y+j, status: GroundStatus.deco,isSolid: isSolid));
            }else{
            add( GroundBlock(gridPoints[0].x+i, gridPoints[0].y+j, status: GroundStatus.normal,isSolid: isSolid));
            }
          }
        }}
        case GrndStatus.floatingRect:{
          //原点と縦横幅を受け取る
          //4つ角を追加
          add(GroundBlock(gridPoints[0].x, gridPoints[0].y, status: GroundStatus.tlCr));
          add(GroundBlock(gridPoints[0].x, gridPoints[0].y+gridPoints[1].y-1, status: GroundStatus.blCr));
          add(GroundBlock(gridPoints[0].x+gridPoints[1].x-1, gridPoints[0].y+gridPoints[1].y-1, status: GroundStatus.brCr));
          add(GroundBlock(gridPoints[0].x+gridPoints[1].x-1, gridPoints[0].y, status: GroundStatus.trCr));
          for(double i=0;i<gridPoints[1].x-2;i++){
            add(GroundBlock(gridPoints[0].x+1 +i, gridPoints[0].y, status: GroundStatus.top));
            add(GroundBlock(gridPoints[0].x+1 +i, gridPoints[0].y + gridPoints[1].y -1 , status: GroundStatus.bottom));
            }
          for(double j=0;j<gridPoints[1].y-2;j++){
            add(GroundBlock(gridPoints[0].x, gridPoints[0].y+1 +j, status: GroundStatus.left));
            add(GroundBlock(gridPoints[0].x + gridPoints[1].x -1, gridPoints[0].y+1+j, status: GroundStatus.right));
            }
          for(double i=0;i<gridPoints[1].x-2;i++){
             for(double j=0;j<gridPoints[1].y-2;j++){
              add(GroundBlock(gridPoints[0].x+1+i, gridPoints[0].y+1+j, status: GroundStatus.normal));
             }
          }
        }

        default:
      }
    }else if(gridPoints.length==3){
      switch(status){
        case GrndStatus.leftCorner:{
         add(Grounds(gridPoints[1].x,gridPoints[1].y, str: '['+'l'*(gridPoints[0].y-gridPoints[1].y).toInt(), direction: GroundsDirection.vertical,
         isSolid: isSolid));
         add(Grounds(gridPoints[1].x+1,gridPoints[1].y, str: 't'*(gridPoints[2].x-gridPoints[1].x).toInt(), direction: GroundsDirection.horizontal,
          isSolid: isSolid));
        }
        case GrndStatus.rightCorner:{
        add(Grounds(gridPoints[0].x,gridPoints[0].y, str: 't'*(gridPoints[1].x-gridPoints[0].x).toInt(), direction: GroundsDirection.horizontal,
         isSolid: isSolid));
         add(Grounds(gridPoints[1].x,gridPoints[1].y, str: ']'+'r'*(gridPoints[2].y-gridPoints[1].y).toInt(), direction: GroundsDirection.vertical,
          isSolid: isSolid));
        }
        default:
      }
    }else if(gridPoints.length ==4){
      switch(status){
        case GrndStatus.rectangle:{
         add(Grounds(gridPoints[1].x,gridPoints[1].y, str: '['+'l'*(gridPoints[0].y-gridPoints[1].y).toInt(), direction: GroundsDirection.vertical,
          isSolid: isSolid));
          add(Grounds(gridPoints[1].x+1,gridPoints[1].y, str: 't'*(gridPoints[2].x-gridPoints[1].x-1).toInt(), direction: GroundsDirection.horizontal,
           isSolid: isSolid));
          add(Grounds(gridPoints[2].x,gridPoints[2].y, str: ']'+'r'*(gridPoints[3].y-gridPoints[2].y).toInt(), direction: GroundsDirection.vertical,
           isSolid: isSolid));
          //deco
          final random = Random();
          for(var i=0;i<gridPoints[2].x-gridPoints[1].x-1;i++){
          for(var j=0;j<gridPoints[0].y-gridPoints[1].y;j++){
            if(random.nextDouble()<0.15){
           add( GroundBlock(gridPoints[1].x+i+1, gridPoints[1].y+j+1, status: GroundStatus.deco,
            isSolid: isSolid));
            }else{
            add( GroundBlock(gridPoints[1].x+i+1, gridPoints[1].y+j+1, status: GroundStatus.normal,
            isSolid: isSolid)); 
            }
          }
        }
        }
        case GrndStatus.invertedRect:{
          add(Grounds(gridPoints[0].x,gridPoints[0].y, str: 'l'*(gridPoints[1].y-gridPoints[0].y).toInt()+'{', direction: GroundsDirection.vertical,
           isSolid: isSolid));
          add(Grounds(gridPoints[1].x+1,gridPoints[1].y, str: 'b'*(gridPoints[2].x-gridPoints[1].x-1).toInt(), direction: GroundsDirection.horizontal,
           isSolid: isSolid));
          add(Grounds(gridPoints[3].x,gridPoints[3].y, str: 'r'*(gridPoints[2].y-gridPoints[3].y).toInt()+'}', direction: GroundsDirection.vertical,
           isSolid: isSolid));
          //deco
          final random = Random();
          for(var i=0;i<gridPoints[2].x-gridPoints[1].x-1;i++){
          for(var j=0;j<gridPoints[1].y-gridPoints[0].y;j++){
            if(random.nextDouble()<0.15){
           add( GroundBlock(gridPoints[0].x+i+1, gridPoints[0].y+j, status: GroundStatus.deco,
            isSolid: isSolid));
            }else{
               add( GroundBlock(gridPoints[0].x+i+1, gridPoints[0].y+j, status: GroundStatus.normal,
            isSolid: isSolid));
            }
          }
        }
        }

        default:
      }
    }
    return super.onLoad();
  }

}