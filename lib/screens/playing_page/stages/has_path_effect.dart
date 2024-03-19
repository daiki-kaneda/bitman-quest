import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class HasPathEffect extends PositionComponent{
  HasPathEffect({this.path,this.pathDuration=2.5,this.pathAlternate=true});
  Path? path;
  final double pathDuration;
  final bool pathAlternate;
}