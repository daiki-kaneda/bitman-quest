import 'dart:async';

import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/sentence.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

//InputFiead 's Parent must be Problem
class InputField extends PositionComponent with StageBlock implements StageObject{
  InputField(
    double x,
    double y,
    {
    this.direction=SentenceDirection.horizontal})
    :gridPosition = Vector2(x, y);
  //String displayText;
  final SentenceDirection direction;

  @override
  final Vector2 gridPosition;

  @override
  final Vector2 velocity=Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    print('loading input field');
    position = Vector2(gridPosition.x*16, gridPosition.y*16);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scrollMove(dt);

    super.update(dt);

    final str = (parent as Problem).inputText;
    removeAll(children);
    add(
      Sentence.fromPosition(
        position,
        str:str.isEmpty ? '?' : str,
        direction: direction)
    );

    
  }

  @override
  void onRemove() {
     removeFromParent();
    super.onRemove();
  }

  InputField copy(){
    return InputField(gridPosition.x, gridPosition.y);
  }

  
}