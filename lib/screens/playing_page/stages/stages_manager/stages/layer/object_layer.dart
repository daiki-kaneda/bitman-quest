import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class ObjectLayer implements StageLayer{
  ObjectLayer(this.layer);
  @override
  final int priority = 5;

  @override
  final List<Component> layer;
}