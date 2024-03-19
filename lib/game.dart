
import 'dart:async';
import 'dart:ui';

import 'package:bitman_quest/game_state/game_state.dart';
import 'package:bitman_quest/screens/dialogs/game_continue_dialog/game_continue_dialog.dart';
import 'package:bitman_quest/screens/dialogs/game_finish_dialog/game_finish_dialog.dart';
import 'package:bitman_quest/screens/dialogs/game_pause_dialog.dart';
import 'package:bitman_quest/screens/playing_page/playng_page.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages_manager.dart' hide Stage;
import 'package:bitman_quest/screens/splash_page/splash_page.dart';
import 'package:bitman_quest/screens/stage_select_page/stage_select_page.dart';
import 'package:bitman_quest/screens/start_page/start_page.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:local_savedata_repository/local_savedata_repository.dart';



class BitmanQuest extends FlameGame with HasCollisionDetection{
  BitmanQuest({required this.savedata});

  final LocalSavedataRepository savedata;

  late final UserData userData;
  late final SettingData settingData;
  late final StatsData statsData;

  late RouterComponent router;

  GameState state = GameState();

  @override
  Future<void> onLoad() async{
    //load assets
    await images.loadAll(
      [
        'colored_packed.png',
        'colored-tiles.png',
        'colored-transparent_packed.png',
        'colored-transparent.png',
        'monochrome-transparent.png',
        'monochrome.png',
        'ui_sprites.png',
        'roguelikeDungeon_transparent.png',
        'platforms.png',
        'backgrounds.png'
      ]
    );

    //get saved data
    userData = savedata.getUserData();
    settingData = savedata.getSettingData();
    statsData = savedata.getStatsData();

   if(userData.progress.stages.isEmpty){
      final stages = <Stage>[
        for(var i=1;i<=22;i++)
        Stage(worldIndex: 1, stageIndex: i),
        for(var i=23;i<=40;i++)
        Stage(worldIndex: 2, stageIndex: i),
         for(var i=41;i<=60;i++)
        Stage(worldIndex: 3, stageIndex: i),
        for(var i=61;i<=80;i++)
        Stage(worldIndex: 4, stageIndex: i),
      ];
      savedata.saveUserData(userData);
   }
   
    router = RouterComponent(
      routes: {
        // TODO: define each component
        'splash':Route(SplashPage.new),
        'home':Route(StartPage.new),
        'setting':Route(()=>CircleComponent(radius: 10)),
        'stage-select':Route(StageSelectPage.new),
       // 'game-play':PlayingRoute(), PlayingRouteだけはpushNamed('game-play')によって、キャッシュされたページを何度も使い回すよりも、pushRoute(PlayingRoute())によって、毎回フレッシュなページをよびだしたい
        'start-dialog':Route(()=>CircleComponent(radius: 10)),
        'pause-dialog':PauseDialog(),
        'continue-dialog':GameContinueDialog(),
        'finish-dialog':GameFinishDialog(),
        'complete':Route(() => CircleComponent(radius: 10))
        },
      initialRoute: 'splash'
      );
    add(router);
    return super.onLoad();
  }

  @override
  Color backgroundColor()=>Colors.black;
}



 enum SpriteSheets{
    coloredPacked,
    coloredTiles,
    coloredTransparentPacked,
    coloredTransparent,
    monochromeTransparent,
    monochrome,
    uiSprites,
    roguelikeDungeonTransparent,
    platforms,
    background
  }

 Sprite getSprite(SpriteSheets sheet,double x,double y,double width,double height){
  switch(sheet){
    case SpriteSheets.coloredPacked:
    return Sprite(
      Flame.images.fromCache('colored_packed.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.coloredTiles:
    return Sprite(
      Flame.images.fromCache('colored-tiles.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.coloredTransparentPacked:
    return Sprite(
      Flame.images.fromCache('colored-transparent_packed.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.coloredTransparent:
    return Sprite(
      Flame.images.fromCache('colored-transparent.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.monochromeTransparent:
    return Sprite(
      Flame.images.fromCache('monochrome-transparent.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.monochrome:
    return Sprite(
      Flame.images.fromCache('monochrome.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.uiSprites:
    return Sprite(
      Flame.images.fromCache('ui_sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.roguelikeDungeonTransparent:
    return Sprite(
      Flame.images.fromCache('roguelikeDungeon_transparent.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.platforms:
    return Sprite(
      Flame.images.fromCache('platforms.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
    case SpriteSheets.background:
    return Sprite(
      Flame.images.fromCache('backgrounds.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height));
  }
 }

