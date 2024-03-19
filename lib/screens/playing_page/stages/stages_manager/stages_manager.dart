import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/stages.dart';
import 'package:flame/components.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';



class Stage {

  factory Stage.fromIndex(int stageIndex) {
    if (stageIndex >= 1) {
      assert(stageIndex <= stages.length);
      return stages[stageIndex - 1];
    } else {
      assert(
          stageIndex.abs() <= additionalStages.length && stageIndex.abs() >= 1);
      return additionalStages[stageIndex.abs() - 1];
    }
  }

  Stage._(this._stage,this.timeLimit,this.world,this.stageIndex);
  final List<Component> _stage;
  final int timeLimit;
  final int world;
  final int stageIndex;
  
  static final List<Stage> stages = [
    Stage._(stage1.components, 150, 1, 1),
    Stage._(stage2.components, 150, 1, 2),
    Stage._(stage3.components, 150, 1, 3),
    Stage._(stage4.components, 150, 1, 4),
    Stage._(stage5.components, 150, 1, 5),
    Stage._(stage6.components, 150, 1, 6),
    Stage._(stage7.components, 150, 1, 7),
    Stage._(stage8.components, 150, 1, 8),
    Stage._(stage9.components, 150, 1, 9),
    Stage._(stage10.components, 150, 1, 10),
    Stage._(stage11.components, 150, 1, 11),
    Stage._(stage12.components, 150, 1, 12),
    Stage._(stage13.components, 150, 1, 13),
    Stage._(stage14.components, 150, 1, 14),
    Stage._(stage15.components, 150, 1, 15),
    Stage._(stage16.components, 150, 1, 16),
    Stage._(stage17.components, 150, 1, 17),
    Stage._(stage18.components, 150, 1, 18),
    Stage._(stage19.components, 150, 1, 19),
    Stage._(stage20.components, 150, 1, 20),
    Stage._(stage21.components, 150, 1, 21),
    Stage._(stage22.components, 150, 1, 22),
    Stage._(stage23.components, 150, 2, 23),
    Stage._(stage24.components, 150, 2, 24),
    Stage._(stage25.components, 150, 2, 25),
    Stage._(stage26.components, 150, 2, 26),
    Stage._(stage27.components, 150, 2, 27),
    Stage._(stage28.components, 150, 2, 28),
    Stage._(stage29.components, 150, 2, 29),
    Stage._(stage30.components, 150, 2, 30),
    Stage._(stage31.components, 150, 2, 31),
    Stage._(stage32.components, 150, 2, 32),
    Stage._(stage33.components, 150, 2, 33),
    Stage._(stage34.components, 150, 2, 34),
    Stage._(stage35.components, 150, 2, 35),
    Stage._(stage36.components, 150, 2, 36),
    Stage._(stage37.components, 150, 2, 37),
    Stage._(stage38.components, 150, 2, 38),
    Stage._(stage39.components, 150, 2, 39),
    Stage._(stage40.components, 150, 2, 40),
    Stage._(stage41.components, 150, 3, 41),
    Stage._(stage42.components, 150, 3, 42),
    Stage._(stage43.components, 150, 3, 43),
    Stage._(stage44.components, 150, 3, 44),
    Stage._(stage45.components, 150, 3, 45),
    Stage._(stage46.components, 150, 3, 46),
    Stage._(stage47.components, 150, 3, 47),
    Stage._(stage48.components, 150, 3, 48),
    Stage._(stage49.components, 150, 3, 49),
    Stage._(stage50.components, 150, 3, 50),
    Stage._(stage51.components, 150, 3, 51),
    Stage._(stage52.components, 150, 3, 52),
    Stage._(stage53.components, 150, 3, 53),
    Stage._(stage54.components, 150, 3, 54),
    Stage._(stage55.components, 150, 3, 55),
    Stage._(stage56.components, 150, 3, 56),
    Stage._(stage57.components, 150, 3, 57),
    Stage._(stage58.components, 150, 3, 58),
    Stage._(stage59.components, 150, 3, 59),
    Stage._(stage60.components, 150, 3, 60),
    for(var i=61;i<=80;i++)
    Stage._(stage1.components, 200, 4, i),
  ];

  static List<Stage> additionalStages = [
    Stage._(bossStage1.components, 150, 1, 1),
    Stage._(bossStage2.components, 150, 2, 2),
    Stage._(stage3.components, 150, 1, 3),
    Stage._(stage4.components, 150, 1, 4),
  ];

  List<Component> get stage => _stage.map((c) => c.copyComponent()).toList();
}






