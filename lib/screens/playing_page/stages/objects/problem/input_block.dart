import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/objects/border.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/sentence.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

//InputBlock 's Parent must be Problem
class InputBlock extends PositionComponent with StageBlock implements StageObject{
  InputBlock(
    double x,
    double y,
    {
      required this.inputText,
      this.maxTap=1
    })
    :gridPosition = Vector2(x, y),
    super(size: Vector2.all(16));
  final String inputText;
  final int maxTap;
  int tapCount = 0;
  bool tappable = true;

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity=Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    add(InputBlockBorder(gridPosition.x, gridPosition.y));
    add(LetterTile.fromChar(gridPosition.x, gridPosition.y, char: inputText));
  }
}
