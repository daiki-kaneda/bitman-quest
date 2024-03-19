import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/music_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sound_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sprite_button.dart';
import 'package:bitman_quest/screens/dialogs/dialog_background_component/bitman_in_dialog.dart';
import 'package:bitman_quest/screens/dialogs/dialog_background_component/flag.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class GameFinishDialog extends Route with HasGameRef<BitmanQuest> {
  GameFinishDialog() : super(GameFinishDialogPage.new, transparent: false);

   @override
  void onPush(Route? previousRoute) {
    previousRoute!
      .stopTime();

    game.state = game.state.copyWith(
        timeSpeed: 0
      );
  }

}

class GameFinishDialogPage extends Component with HasGameRef<BitmanQuest> {
  @override
  Future<void> onLoad() async {
    final world = World();
    final cameraComponent = CameraComponent(world: world);
    cameraComponent.viewfinder
    //..visibleGameSize = Vector2(0, 200)
    .anchor = Anchor.center;
    final bitman =
        BitmanInDialog(50, 50, status: BitmanInDialogStatus.successed);
    cameraComponent.follow(bitman);

    await addAll([world, cameraComponent]);
    //Background

    final testLayer1 = [
      // for(double i=0;i<1000;i++)
      // for(double j=0;j<1000;j++)
      // SimpleTile(i, j)
    ].map((c) => c..priority = 0);

    final testLayer2 = [bitman].map((c) => c..priority = 1);

     final testLayer3 = [Flag(52, 50)].map((c) => c..priority = 2);

    final testStageComponents = <Component>[...testLayer1, ...testLayer2,...testLayer3];
    world.addAll(testStageComponents);

    final menuButton = SpriteButton(
        sprite: getSprite(SpriteSheets.uiSprites, 669, 315, 48, 48),
        onPressed: () {
          game.router.pop();
          game.router.pushReplacementNamed('stage-select');
        });

    final nextButton = SpriteButton(
        sprite: getSprite(SpriteSheets.uiSprites, 487, 233, 80, 80),
        onPressed: () {
          //stageIndex==80の時は次のステージがないので、違うゴールブロックにして、completeDialogにつなげ料
          game.state = game.state.copyWith(
            stageSelected: game.state.stageSelected+1
          );
          game.router.pushReplacement(PlayingRoute());
        })..size = Vector2.all(50);

    cameraComponent.viewport.addAll(
      [
       menuButton..position = Vector2(game.size.x/2-50,game.size.y/3),
       nextButton..position = Vector2(game.size.x/2+50,game.size.y/3)
      ]
    );
  }
}
