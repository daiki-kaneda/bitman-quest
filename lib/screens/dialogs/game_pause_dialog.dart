import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/music_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sound_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sprite_button.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class PauseDialog extends Route with HasGameRef<BitmanQuest>{
  PauseDialog():super(PauseDialogPage.new,transparent: true);

   @override
  void onPush(Route? previousRoute) {
    previousRoute!
      .stopTime();

    game.state = game.state.copyWith(
        timeSpeed: 0
      );
  }

  @override
  void onPop(Route nextRoute) {
    nextRoute
      .resumeTime();

    game.state = game.state.copyWith(
        timeSpeed: 1
      );
  }

}


class PauseDialogPage extends Component with HasGameRef<BitmanQuest>{

  @override
  Future<void> onLoad() async{
    //restartボタン欲しい
    final menuButton = SpriteButton(
        sprite: getSprite(SpriteSheets.uiSprites, 669, 315, 48, 48),
        onPressed: () {
          game.router.pop();
          game.router.pushReplacementNamed('stage-select');
        });
    final resumeButton = SpriteButton(
        sprite: getSprite(SpriteSheets.uiSprites, 101, 101, 48, 48),
        onPressed: () => game.router.pop());
    final retryButton = SpriteButton(
        sprite: getSprite(SpriteSheets.uiSprites, 487, 101, 48, 48),
        onPressed: () {
          //元のPlayingRouteをpopしたい。
          game.router.popUntilNamed('stage-select');
          game.router.pushRoute(PlayingRoute());
        },
        //routerのstackとchildrenの違いを理解したいdesu
        anchor: Anchor.center,
        scale: Vector2(-1, 1));
     
    
   addAll([
    menuButton..position = Vector2(game.canvasSize.x/2-100,game.canvasSize.y/3),
    resumeButton..position = Vector2(game.canvasSize.x/2-50,game.canvasSize.y/3),
    retryButton..position = Vector2(game.canvasSize.x/2 + 24,game.canvasSize.y/3 + 24),
    //MusicToggle()..position = Vector2(game.canvasSize.x/2,game.canvasSize.y/3),
    SoundToggle()..position = Vector2(game.canvasSize.x/2+50,game.canvasSize.y/3),
    ]);
    
    }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }
}