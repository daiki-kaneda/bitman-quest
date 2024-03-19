import 'package:bitman_quest/screens/dialogs/dialog_background_component/bitman_in_dialog.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/simple_tile.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages_manager.dart';
import 'package:flame/components.dart';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/music_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sound_toggle.dart';
import 'package:bitman_quest/screens/components/ui/sprite_button/sprite_button.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class GameContinueDialog extends Route with HasGameRef<BitmanQuest>{
  GameContinueDialog():super(
    GameContinueDialogPage.new,
    transparent: false,
    maintainState: false
    );
}


class GameContinueDialogPage extends Component with HasGameRef<BitmanQuest>{

  @override
  Future<void> onLoad() async{
    final world = World();
    final cameraComponent = CameraComponent(world: world);
    cameraComponent.viewfinder
   // ..visibleGameSize = Vector2(0, 200)
    .anchor = Anchor.center;
    final bitman =  BitmanInDialog(50,50 , status: BitmanInDialogStatus.failed);
    cameraComponent.follow(bitman);

    await addAll([world,cameraComponent]);
    //Background 

final testLayer1 = [
  // for(double i=0;i<1000;i++)
  // for(double j=0;j<1000;j++)
  // SimpleTile(i, j)
].map((c) => c..priority = 0);

final testLayer2 = [
  bitman
].map((c) => c..priority = 1);

 final testStageComponents = <Component>[
  ...testLayer1,
 
  ...testLayer2
];
  world.addAll(testStageComponents);


    //HUD
    final menuButton = SpriteButton(
      sprite: getSprite(SpriteSheets.uiSprites, 669, 315, 48, 48),
       onPressed: (){
        game.router.pop();
        game.router.pushReplacementNamed('stage-select');
       }
       );

    final retryButton = SpriteButton(
      sprite: getSprite(SpriteSheets.uiSprites, 487, 101, 48, 48),
       onPressed: (){

        print(game.router.stack);
       // game.router.children.whereType<PlayingRoute>()!.forEach((r) {r.removeFromParent(); });
        game.router.pushRoute(PlayingRoute());
        print(game.router.stack);
        },
        //routerのstackとchildrenの違いを理解したいdesu
       anchor: Anchor.center,
       scale: Vector2(-1, 1)
       );
     
    
    cameraComponent.viewport.addAll([
    menuButton..position = Vector2(game.size.x/2-50,game.size.y/3),
    retryButton..position = Vector2(game.size.x/2+75,game.size.y/3 + 25)
    ]);
    
    }

  
}