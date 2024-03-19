
import 'package:flame/components.dart';

class StageObject extends PositionComponent{
  StageObject(this.gridPosition,this.velocity);
  final Vector2 gridPosition;
  final Vector2 velocity;
}