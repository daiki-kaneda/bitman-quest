import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class HasRotateEffect extends PositionComponent{
  HasRotateEffect({this.initialAngle=0,this.rotateAngle=0,this.rotateDuration=2.5,this.rotateAlternate=true});
  final double initialAngle;
  final double rotateAngle;
  final double rotateDuration;
  final bool rotateAlternate;
}