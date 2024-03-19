
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class ProblemLayer implements StageLayer{
  ProblemLayer(this.layer);
  @override
  final int priority = 2;

  @override
  final List<Component> layer;
}