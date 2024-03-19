
import 'dart:async';

import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

//for teleport enemy
class ReferencePoint extends PositionComponent with StageBlock implements StageObject{
  ReferencePoint(double x,double y):gridPosition = Vector2(x, y);

  @override
  final Vector2 gridPosition;

  final velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    position = gridPosition * 16;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);
    super.update(dt);
  }
}