
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class EnemyLayer implements StageLayer{
  EnemyLayer(this.layer);
  @override
  final int priority = 4;

  @override
  final List<Component> layer;
}