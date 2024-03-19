
import 'package:bitman_quest/screens/playing_page/stages/background/simple_tile.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/stage_background.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/start_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/stage_layer.dart';
import 'package:flame/components.dart';


class BackgroundLayer implements StageLayer{
  BackgroundLayer({this.status=BackgroundStatus.cave2}):layer=[
    StageBackground(status)
  ];

  @override
  final int priority = 0;

  final BackgroundStatus status;

  @override
  final List<Component> layer;
}