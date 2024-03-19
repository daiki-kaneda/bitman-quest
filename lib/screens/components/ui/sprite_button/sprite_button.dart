
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class SpriteButton extends SpriteComponent with TapCallbacks{
  SpriteButton({
    required super.sprite,
    required this.onPressed,
    super.position,
    super.anchor,
    super.scale}):super(size: Vector2.all(48));

  final VoidCallback onPressed;

  @override
  void onTapDown(TapDownEvent event) {
    scale *= 0.85;
    super.onTapDown(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale.normalize();
    scale*=sqrt(2);
    super.onTapCancel(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
   scale.normalize();
    scale*=sqrt(2);
    onPressed();
    super.onTapUp(event);
  }
  
}