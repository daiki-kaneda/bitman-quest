
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Tile extends Component{
  Tile(this.gridPosition);
  final Vector2 gridPosition;
}