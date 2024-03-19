
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/stage_select_page/bitman.dart';
import 'package:bitman_quest/screens/stage_select_page/layer_manager.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/river_tile.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/road_tile.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class StageSelectPage extends Component 
with HasGameRef<BitmanQuest>{


  @override
  Future<void> onLoad() async{
    //TODO : ビットマンをクリアしていないステージの一歩手前に配置する
    final bitman = BitmanInMap(0, 99)..priority = 10;

    final world = World();
    final cameraComponent = CameraComponent(world: world);
    cameraComponent
    ..follow(bitman)
    ..viewfinder.anchor = Anchor.center;
    addAll([world,cameraComponent]);
    world.add(bitman);

    final zoomOutButton = HudButtonComponent(
      button: SpriteComponent(sprite:getSprite(SpriteSheets.coloredTransparent,783,273,14,14),size: Vector2.all(32)),
      margin: const EdgeInsets.only(left:40,bottom: 40),
      onPressed: () {
        cameraComponent.viewfinder.zoom /= 2;
      },
    );
    final zoomInButton = HudButtonComponent(
      button: SpriteComponent(sprite:getSprite(SpriteSheets.coloredTransparent,800,273,14,14),size: Vector2.all(32)),
      margin: const EdgeInsets.only(right:40,bottom: 40),
      onPressed: () {
        cameraComponent.viewfinder.zoom *= 2;
      },
    );
    addAll([zoomOutButton,zoomInButton]);
    world.addAll(layer1);
  //   world.addAll(
  //     [for(double i=0;i<48;i++)
  // RiverTile(FencePosition.top, i, 48)..priority = 1
  // ..position = Vector2(i*16, i*16),
  //     ]
  //   );
    world.addAll(layer2);
    world.addAll(layer3);
    
    //Layerをworldに加えて、それぞれのpriority,bitmanのpriorityを適切に設定する。

  }
}