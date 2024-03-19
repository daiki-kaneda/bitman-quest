import 'package:bitman_quest/screens/playing_page/stages/background/simple_tile.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/start_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class BackgroundDecorationLayer implements StageLayer{
  BackgroundDecorationLayer(this.layer);
  @override
  final int priority = 1;

  @override
  final List<Component> layer;
}