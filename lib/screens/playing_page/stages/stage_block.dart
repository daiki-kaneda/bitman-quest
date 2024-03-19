
//ステージ内のブロック（PlayingPageのobjectSpeedに従って、移動し、removeされた時には、位置を元に戻す）

import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/stage_object.dart';
import 'package:flame/components.dart';

mixin StageBlock on PositionComponent implements StageObject {
  void resetPosition() {
    position = Vector2(gridPosition.x*16,gridPosition.y*16);
  }

  void scrollMove(double dt){
    velocity.x = findParent<PlayingPage>()!.state.objectSpeed;
    position +=  velocity * dt;
  }
}
