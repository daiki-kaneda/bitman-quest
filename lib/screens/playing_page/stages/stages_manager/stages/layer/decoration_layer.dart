import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';

class DecorationLayer implements StageLayer{
  DecorationLayer(this.layer);
  @override
  final int priority = 6;

  @override
  final List<Component> layer;
}