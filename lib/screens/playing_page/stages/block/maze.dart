import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/block/mass_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages_manager.dart';
import 'package:flame/components.dart';


class Maze extends PositionComponent implements StageObject{
  Maze(double x,double y,{
    this.isHorizontal=true,
    required this.rank,
    required this.amount,
    this.eraces = const [],
    this.adds = const [],
    this.replaces = const [],
    required this.status,}):gridPosition=Vector2(x, y);

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity = Vector2.zero();

  //迷路が横向きに広がっているか、縦向きに広がっているか
  final bool isHorizontal;
  //迷路の階数
  final double rank;
  //迷路の幅（高さ）
  final double amount;
  //迷路のブロックの消す場所を指定するグリッドポジションのリスト(2マスずつ消す)
  final List<Vector2> eraces;
  //迷路のブロックの加える場所を指定するグリッドポジションのリスト(2マスずつ足す)
  final List<Vector2> adds;
  //迷路のブロックを任意に入れ替えるためのコンポネンと
  final List<Component> replaces;
  final MassBlockStatus status;

  @override
  FutureOr<void> onLoad() {
    if(isHorizontal){
    for(var i=0;i<amount;i++){
      for(var j=0;j<rank;j++){
        add(MassBlock(gridPosition.x+i, gridPosition.y+ 3*j, status: status));
      }
      }
    for(final p in eraces){
      removeAll(children.whereType<MassBlock>()
      .where((b){
       return b.gridPosition == p || b.gridPosition == Vector2(p.x+1, p.y);
        }).toList());
    }
    for(final p in adds){
      addAll([
        MassBlock(p.x, p.y, status: status),
        MassBlock(p.x, p.y+1, status: status),
        ]);
    }
    for(final c in replaces){
      if(c is StageObject){
       removeAll(children.whereType<StageBlock>()
      .where((b){
       return b.gridPosition == c.gridPosition;
        }).toList());
        add(c);
      }
    }
    }else{
      for(var i=0;i<rank;i++){
      for(var j=0;j<amount;j++){
        add(MassBlock(gridPosition.x+ i*3, gridPosition.y+j, status: status));
      }
      }
    for(final p in eraces){
      removeAll(children.whereType<MassBlock>()
      .where((b){
       return b.gridPosition == p || b.gridPosition == Vector2(p.x, p.y+1);
        }).toList());
    }
    for(final p in adds){
      addAll([
        MassBlock(p.x, p.y, status: status),
        MassBlock(p.x+1, p.y, status: status),
        ]);
    }
    for(final c in replaces){
      if(c is StageObject){
       removeAll(children.whereType<StageBlock>()
      .where((b){
       return b.gridPosition == c.gridPosition;
        }).toList());
        add(c);
      }
    }
    }
    return super.onLoad();
  }

}