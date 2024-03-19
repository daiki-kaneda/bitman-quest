
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class PlatformLayer implements StageLayer{
  PlatformLayer(this.layer);
  @override
  final int priority = 3;

  @override
  final List<Component> layer;
}