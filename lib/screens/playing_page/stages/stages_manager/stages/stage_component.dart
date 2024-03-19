
import 'package:bitman_quest/screens/playing_page/stages/background/simple_tile.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/grounds.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/simple_move_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/border.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/frame.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/goal_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/blackboard.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/input_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/input_field.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/locked_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/sentence.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/spring.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/start_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/background_decoration_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/background_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/decoration_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/enemy_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/object_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/platform_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/problem_layer.dart';
import 'package:flame/components.dart';

class StageComponents{

  StageComponents(
    this.stageIndex,{
    required this.background,
    required this.backgroundDecorations,
    required this.problems,
    required this.platforms,
    required this.enemies,
    required this.objects,
    required this.decorations
  });

  final int stageIndex;

  final BackgroundLayer background;

  final BackgroundDecorationLayer backgroundDecorations;

  final ProblemLayer problems;

  final PlatformLayer platforms;

  final EnemyLayer enemies;

  final ObjectLayer objects;

  final DecorationLayer decorations;

  List<Component> get components => [
    ...background.layer..map((c) => c..priority = background.priority),
    ...backgroundDecorations.layer..map((c) => c..priority = backgroundDecorations.priority),
    ...problems.layer..map((c) => c..priority = problems.priority),
    ...platforms.layer..map((c) => c..priority = platforms.priority),
    ...enemies.layer..map((c) => c..priority = enemies.priority),
    ...objects.layer..map((c) => c..priority = objects.priority),
    ...decorations.layer..map((c) => c..priority = decorations.priority),
  ];
}

