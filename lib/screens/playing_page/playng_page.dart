
import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/HUD/attack_button.dart';
import 'package:bitman_quest/screens/playing_page/HUD/joystick.dart';
import 'package:bitman_quest/screens/playing_page/HUD/jump_button.dart';
import 'package:bitman_quest/screens/playing_page/HUD/life.dart';
import 'package:bitman_quest/screens/playing_page/HUD/pause_button.dart';
import 'package:bitman_quest/screens/playing_page/HUD/time.dart';
import 'package:bitman_quest/screens/playing_page/play_state/play_state.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/ride/ride.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/decoration/chimney.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/decoration/chimney_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/simple_tile.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/stage_background.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/breakable_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/breakables.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/floating_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/grounds.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/mass.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/mass_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/maze.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/platform_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/scalable_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/teleportable_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/template_grounds.dart';
import 'package:bitman_quest/screens/playing_page/stages/decoration/cord_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/decoration/cords.dart';
import 'package:bitman_quest/screens/playing_page/stages/decoration/decoration.dart' as Deco;
import 'package:bitman_quest/screens/playing_page/stages/decoration/random_decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/dangers.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/emitter.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/reference_point.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/simple_move_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/danger_object.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/skelton.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/spawner.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/ghost.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/golem.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/witch.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/enemy_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/teleportable_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/heal_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/helmet_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/power_up_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/transform_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/weapon_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/border.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/end_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/entrance.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/frame.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/goal_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/letter.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/blackboard.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/input_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/input_field.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/locked_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/lockeds.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/problem.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/spawn_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/problem/spawns.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/sentence.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/spring.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/start_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class PlayingRoute extends Route with HasGameRef<BitmanQuest>{
  PlayingRoute():super(
    PlayingPage.new,
    maintainState: false);

    @override
  FutureOr<void> onLoad() {
    print('PlayPage');
    return super.onLoad();
  }
}

class PlayingPage extends Component with HasGameRef<BitmanQuest>,HasTimeScale{

  PlayingPage();
  final PlayingState state = PlayingState();


  

  @override
  Future<void> onLoad() async{

    final world = World();
    final cameraComponent = CameraComponent.withFixedResolution(width: 800,height: 320,world: world);
    //Todo make camera follow bitman ??
    addAll([world,cameraComponent]);

    //TODO add Hud components
    final joyStick = JoyStick();
    //bitman
    final bitman = Bitman(joystick: joyStick);
    
    final jumpButton = JumpButton(bitman);
    final attackButton = AttackButton(bitman);
    final pauseButton = PauseButton();
    final lives = [
      LifeWithMargin(6, 40),
      LifeWithMargin(4, 80),
      LifeWithMargin(2,120),
      ];
   await cameraComponent.viewport.addAll([
      joyStick,
      jumpButton,
      attackButton,
      pauseButton,
      ]);
    cameraComponent.viewport.addAll(lives);
     //todo add bitman to world
    world.add(bitman
    ..position=Vector2(3*16+8, 11*16+8)
    ..priority =10);

    final stageIndex = game.state.stageSelected;
    final stage = Stage.fromIndex(stageIndex);
    //timer
    double timeLimit = stage.timeLimit.toDouble();
    final timerDisplay = RemainingTime(timeLimit);
    cameraComponent.viewport.add(timerDisplay);
    print(stageIndex);
    //add stage
    world.addAll(stage.stage);
    //cameraComponent.follow(bitman);
    //for debug 
    //cameraComponent.viewfinder.visibleGameSize = Vector2(100, 320);
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    //gameover logic (no life) or (time up) or (fall)
    if(state.lives<1 || state.timeUp || state.fallDown){
      if(!state.isGameover){
      game.router.pushReplacementNamed('continue-dialog');
      state.isGameover = true;
      print('gameover');
      }
    }
    super.update(dt);
  }

}

 extension ComponentX on Component {
  Component copyComponent(){
    final self = this;
    //ローカル変数しか型制限できない
    if(self is SimpleTile){
      return SimpleTile(self.gridPosition.x, self.gridPosition.y)..priority=self.priority;
    }
    if(self is GroundBlock){
      return GroundBlock(self.gridPosition.x,self.gridPosition.y, status:self.status,isSolid: self.isSolid)
      ..priority=self.priority;
    }
    if(self is Grounds){
      return Grounds(self.gridPosition.x, self.gridPosition.y, str: self.str, direction:self.direction,isSolid: self.isSolid)
      ..priority=self.priority;
    }
    if(self is Problem){
      return Problem(
        id: self.id,
       problem: self.problem.map((c) => c.copyComponent()).toList(),
       answer: self.answer,
       maxLength: self.maxLength)
       ..priority=self.priority;
    }
    if(self is BlackBoard){
      return BlackBoard(
        self.gridPosition.x,
       self.gridPosition.y,
        self.w, 
        self.h,
         status:self.status)
         ..priority=self.priority;
    }
    if(self is InputBlock){
      return InputBlock(
        self.gridPosition.x,
        self.gridPosition.y,
       inputText: self.inputText
       )..priority=self.priority;
    }
    if(self is InputField){
      return InputField(self.gridPosition.x, self.gridPosition.y)
      ..priority=self.priority;
    }
    if(self is LockedBlock){
      return LockedBlock(self.gridPosition.x, self.gridPosition.y)
      ..priority=self.priority;
    }
    if(self is SpawnBlock){
      return SpawnBlock(self.gridPosition.x, self.gridPosition.y);
    }
    if(self is InputBlockBorder){
      return InputBlockBorder(self.gridPosition.x, self.gridPosition.y)
      ..priority=self.priority;
    }
    if(self is FrameTile){
      return FrameTile(self.gridPosition.x, self.gridPosition.y,status: self.status,direction: self.direction)
      ..priority=self.priority;
    }
    if(self is GoalBlock){
      return GoalBlock(self.gridPosition.x, self.gridPosition.y,stageIndex: self.stageIndex)
      ..priority=self.priority;
    }
    if(self is LetterTile){
      return LetterTile(self.gridPosition.x, self.gridPosition.y,status: self.status,letterSize: self.letterSize,
      path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration)
      ..priority=self.priority;
    }
    if(self is Sentence){
      return Sentence(self.gridPosition.x, self.gridPosition.y,str: self.str,direction: self.direction,letterSize: self.letterSize,
      path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration)
      ..priority=self.priority;
    }
    if(self is StartPosition){
      return StartPosition(self.gridPosition.x, self.gridPosition.y)
      ..priority=self.priority;
    }
    if(self is EndPosition){
      return EndPosition(self.gridPosition.x, self.gridPosition.y);
    }
    if(self is SimpleMoveEnemy){
      return SimpleMoveEnemy(self.gridPosition.x, self.gridPosition.y,status: self.status, interval: self.interval,abnormalStatus: self.abnormalStatus,path: self.path,pathDuration: self.pathDuration,pathAlternate: self.pathAlternate)
      ..priority=self.priority;
    }
    if(self is Spring){
      return Spring(self.gridPosition.x, self.gridPosition.y)
      ..priority=self.priority;
    }
    if(self is DangerObject){
      return DangerObject(self.gridPosition.x, self.gridPosition.y,
       status: self.status, direction: self.direction,abnormalStatus: self.abnormalStatus,path: self.path,pathDuration: self.pathDuration,pathAlternate: self.pathAlternate);
    }
    if(self is Dangers){
      return Dangers(self.gridPosition.x, self.gridPosition.y, status: self.status, length: self.length, direction: self.direction,path: self.path,pathDuration: self.pathDuration,pathAlternate: self.pathAlternate);
    }
    if(self is Platform){
      return Platform(self.gridPosition.x, self.gridPosition.y, length: self.length,fallable: self.fallable,path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration);
    }
    if(self is PlatformBlock){
      return PlatformBlock(self.gridPosition.x, self.gridPosition.y, status: self.status,path: self.path,pathAlternate:self.pathAlternate,pathDuration: self.pathDuration);
    }

    if(self is ChimneyBlock){
      return ChimneyBlock(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is Chimney){
      return Chimney(self.gridPosition.x, self.gridPosition.y, length: self.length, direction: self.direction);
    }
    if(self is MassBlock){
      return MassBlock(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is Mass){
      return Mass(self.gridPosition.x, self.gridPosition.y, w: self.w, h: self.h, status: self.status);
    }
    if(self is Grnd){
      return Grnd(gridPoints: self.gridPoints, status: self.status,isSolid: self.isSolid);
    }
    if(self is Deco.Decoration){
      return Deco.Decoration(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is RandomDecoration){
      return RandomDecoration(self.gridPosition.x, self.gridPosition.y, w: self.w, status: self.status, prob: self.prob);
    }
    if(self is HealItem){
      return HealItem(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is WeaponItem){
      return WeaponItem(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is HelmetItem){
      return HelmetItem(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is PowerUpItem){
      return PowerUpItem(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is Skelton){
      return Skelton(self.gridPosition.x, self.gridPosition.y, status: self.status, interval: self.interval,abnormalStatus: self.abnormalStatus);
    }
    if(self is Projectile){
      return Projectile.fromPosition(self.position, status: self.status, direction: self.direction,abnormalStatus: self.abnormalStatus);
    }
    if(self is Emitter){
      return Emitter(self.gridPosition.x, self.gridPosition.y, abnormalStatus: self.abnormalStatus,direction: self.direction,interval: self.interval,status: self.status);
    }
    if(self is BreakableBlock){
      return BreakableBlock(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is Breakables){
      return Breakables(self.gridPosition.x, self.gridPosition.y, w: self.w, h: self.h, status: self.status);
    }
    if(self is Ride){
      return Ride(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is ScalableBlock){
      return ScalableBlock(self.gridPosition.x, self.gridPosition.y,basisAnchor: self.basisAnchor,initialAmount: self.initialAmount,scaleAmount: self.scaleAmount,
      scaleDuration: self.scaleDuration,isHorizontal: self.isHorizontal,
      path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration);
    }
    if(self is Entrance){
      return Entrance(self.gridPosition.x, self.gridPosition.y, stageIndex: self.stageIndex, status: self.status);
    }
    if(self is Golem){
      return Golem(self.gridPosition.x, self.gridPosition.y,abnormalStatus: self.abnormalStatus,path: self.path,pathDuration: self.pathDuration,pathAlternate: self.pathAlternate);
    }
    if(self is EnemyLockedBlock){
      return EnemyLockedBlock(self.gridPosition.x, self.gridPosition.y);
    }
    if(self is Maze){
      return Maze(self.gridPosition.x, self.gridPosition.y, rank: self.rank, amount: self.amount,isHorizontal: self.isHorizontal, status: self.status,eraces: self.eraces,adds: self.adds,replaces: self.replaces.map((c) => c.copyComponent()).toList());
    }
    if(self is FloatingBlock){
      return FloatingBlock(self.gridPosition.x, self.gridPosition.y, status: self.status,
      path: self.path,pathDuration: self.pathDuration,pathAlternate: self.pathAlternate,
      initialAngle: self.initialAngle,rotateAngle: self.rotateAngle,rotateDuration: self.rotateDuration,rotateAlternate: self.rotateAlternate,
      customSize: self.customSize
      );
    }
    if(self is TeleportableEnemy){
      return TeleportableEnemy(self.gridPosition.x, self.gridPosition.y, status: self.status, interval: self.interval,abnormalStatus: self.abnormalStatus,targetPoints: self.targetPoints);
    }
    if(self is ReferencePoint){
      return ReferencePoint(self.gridPosition.x, self.gridPosition.y);
    }
    if(self is TeleportableBlock){
      return TeleportableBlock(self.gridPosition.x, self.gridPosition.y, targetPoints: self.targetPoints, color: self.color,count: self.count);
    }
    if(self is Lockeds){
      return Lockeds(status: self.status, gridPoints: self.gridPoints,eraces: self.eraces);
    }
    if(self is Spawns){
      return Spawns(status: self.status, gridPoints:self.gridPoints);
    }
    if(self is Witch){
      return Witch(self.gridPosition.x, self.gridPosition.y, normalTargetPoints: self.normalTargetPoints, angryTargetPoints: self.angryTargetPoints, crazyTargetPoints: self.crazyTargetPoints);
    }
    if(self is StageBackground){
      return StageBackground(self.status);
    }
    if(self is Spawner){
      return Spawner(self.gridPosition.x, self.gridPosition.y, status: self.status,direction: self.direction,
      abnormalStatus: self.abnormalStatus,path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration);
    }
    if(self is TransformItem){
      return TransformItem(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is CordBlock){
      return CordBlock(self.gridPosition.x, self.gridPosition.y, status: self.status);
    }
    if(self is Cords){
      return Cords(self.gridPosition.x, self.gridPosition.y, w: self.w, h: self.h, status: self.status);
    }
    if(self is Ghost){
      return Ghost(self.gridPosition.x, self.gridPosition.y,abnormalStatus: self.abnormalStatus,path: self.path,pathAlternate: self.pathAlternate,pathDuration: self.pathDuration);
    }
    
    
    return this; //上のパターンにマッチしなければ、参照を変えずに返す
  }
}




