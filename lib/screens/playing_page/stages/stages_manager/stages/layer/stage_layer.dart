
import 'package:flame/components.dart';

class StageLayer{
  StageLayer(this.priority,this.layer);
  final int priority;
  final List<Component> layer;
}