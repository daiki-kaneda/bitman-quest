

import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class RemainingTime extends TimerComponent{
  RemainingTime(this.timeLimit):super(
    period: timeLimit
    );

  final double timeLimit;

  @override
  void onTick() {
    if(timer.current>timeLimit){
      //TODO push finish dialog
    }
    super.onTick();
  }

   final TextPaint textPaint = TextPaint(
    style: const TextStyle(color: Colors.white,fontSize: 20,fontFamily:'DSEG')
   );
  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, (timeLimit-timer.current).toStringAsFixed(0),Vector2(70, 10));
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if(timeLimit-timer.current<0) findParent<PlayingPage>()!.state.timeUp = true;
    super.update(dt);
  }
}