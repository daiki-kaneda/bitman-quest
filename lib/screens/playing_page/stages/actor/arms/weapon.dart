
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:flame/components.dart';


class Weapon extends SpriteGroupComponent<BitmanWeapon>{
  Weapon():super(size: Vector2.all(14),anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() {
    current = BitmanWeapon.none;
    final shovelSprite = getSprite(SpriteSheets.coloredTransparentPacked, 673, 81, 14, 14);
    final pickSprite = getSprite(SpriteSheets.coloredTransparentPacked, 690, 82, 12, 12);
    final swordSprite = getSprite(SpriteSheets.coloredTransparent, 545, 137, 14, 14);
    final gunSprite = getSprite(SpriteSheets.coloredTransparentPacked, 592, 144, 16, 16);
    final arrowSprite = getSprite(SpriteSheets.coloredTransparentPacked, 609, 81, 14, 14);
    final bombSprite = getSprite(SpriteSheets.coloredTransparentPacked, 720, 144, 16, 16);
    final dynamiteSprite = getSprite(SpriteSheets.coloredTransparentPacked, 736, 144, 16, 16);
    sprites={
      BitmanWeapon.shovel:shovelSprite,
      BitmanWeapon.pick:pickSprite,
      BitmanWeapon.sword:swordSprite,
      BitmanWeapon.gun:gunSprite,
      BitmanWeapon.arrow:arrowSprite,
      BitmanWeapon.bomb:bombSprite,
      BitmanWeapon.dynamite:dynamiteSprite,
    };
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    priority = bitman.priority+1;
    
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final bitman = findParent<World>()!.firstChild<Bitman>()!;
    current = bitman.weapon;
    scale.x = bitman.scale.x<0 ? -1 :1;
    position = Vector2(bitman.position.x + 8*bitman.scale.x, bitman.position.y);
    super.update(dt);
  }
}