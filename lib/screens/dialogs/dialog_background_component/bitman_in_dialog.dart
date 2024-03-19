
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:flame/components.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';

enum BitmanInDialogStatus{
  successed,failed
}

class BitmanInDialog extends SpriteComponent with StageBlock implements StageObject{
  BitmanInDialog(double x,double y,{required this.status}):gridPosition=Vector2(x, y),super(size: Vector2.all(32));

  @override
  final Vector2 gridPosition;

  final BitmanInDialogStatus status;
  @override
  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    switch(status){
      case BitmanInDialogStatus.successed:sprite = getSprite(SpriteSheets.coloredTransparentPacked, 18*16, 7*16+1, 16, 16);
      case BitmanInDialogStatus.failed:sprite = getSprite(SpriteSheets.coloredTransparentPacked, 23*16, 7*16, 16, 16);
    }
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    return super.onLoad();
  }
}