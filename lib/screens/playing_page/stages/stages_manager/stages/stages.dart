

import 'dart:math';

import 'package:bitman_quest/screens/playing_page/stages/actor/bitman.dart';
import 'package:bitman_quest/screens/playing_page/stages/actor/ride/ride.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/decoration/chimney.dart';
import 'package:bitman_quest/screens/playing_page/stages/background/stage_background.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/breakable_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/breakables.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/floating_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
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
import 'package:bitman_quest/screens/playing_page/stages/decoration/decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/decoration/random_decoration.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/danger_object.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/dangers.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/emitter.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/projectile.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/reference_point.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/simple_move_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/skelton.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/spawner.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/ghost.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/golem.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/boss/witch.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/stage_enemy/enemy_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/common/teleportable_enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/enemy/enemy.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/heal_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/helmet_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/transform_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/item/weapon_item.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/end_position.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/entrance.dart';


import 'package:bitman_quest/screens/playing_page/stages/objects/frame.dart';
import 'package:bitman_quest/screens/playing_page/stages/objects/goal_block.dart';
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
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/background_decoration_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/background_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/decoration_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/enemy_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/object_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/platform_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/layer/problem_layer.dart';
import 'package:bitman_quest/screens/playing_page/stages/stages_manager/stages/stage_component.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart' hide Decoration;


//stage1
final stage1 = StageComponents(
  1,
 background:BackgroundLayer(status: BackgroundStatus.cave2),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(8, 0, length: 16, direction: ChimneyDirection.vertical),
    Chimney(36, 0, length: 16, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 16, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
 for(double i=0;i<5;i++)
 Problem(id: "$i", problem: [
  InputField(10+i, 10)
 ], answer: ["1"]),
//  Sentence(18, 10, str: "1+4", direction: SentenceDirection.vertical,
//  path: Path()..lineTo(16*8, 0)),
 Sentence(18, 8, str: "135", direction: SentenceDirection.horizontal,
 path: Path()..lineTo(16*8, 16*1))
 ]),
 platforms: PlatformLayer([
  Platform(15, 10, length: 3, fallable: false,
  path: Path()..lineTo(16*1, 0)
  ..lineTo(16*3, 16*1)),
  
   Grnd(status: GrndStatus.rectangle,gridPoints: [Vector2(0, 19),Vector2(0, 16),Vector2(31, 16),Vector2(31, 19)]),
   Grnd(status: GrndStatus.rectangle, gridPoints:[Vector2(36, 19),Vector2(36, 16),Vector2(46, 16),Vector2(46, 19)]),
   Grnd(status: GrndStatus.leftCorner, gridPoints: [Vector2(50, 19),Vector2(50, 11),Vector2(53, 11)],isSolid: false),
   Grnd(status: GrndStatus.dSlope, gridPoints: [Vector2(54, 11),Vector2(58, 15)]),
   GroundBlock(58, 16, status: GroundStatus.trJt),
   Grnd(status: GrndStatus.rightCorner, gridPoints:[Vector2(59, 16),Vector2(74, 16),Vector2(74, 19)]),
   Grnd(status: GrndStatus.deco, gridPoints: [Vector2(51, 17),Vector2(23, 3)]),
   Platform(30, 13, length: 8,fallable: false)
 ]),
 enemies: EnemyLayer([
  //Ghost(10, 10),
  Dangers(10, 4, status: DangerObjectStatus.icicle, length: 10, direction: DangerObjectDirection.bottom),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  TransformItem(11, 15, status: BitmanColor.speedYellow),
  WeaponItem(10, 15, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  GoalBlock(73, 15, stageIndex: 1)
 ]),
 decorations: DecorationLayer([
  Decoration(1, 15, status: DecorationStatus.bSignboard),
  RandomDecoration(2, 15, w: 30, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(36, 15, w: 11, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(59, 15, w: 13, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '0-1', direction: SentenceDirection.horizontal)
 ])
 );


 //stage2
 final stage2 = StageComponents(
  2,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(23, 0, length: 17, direction: ChimneyDirection.vertical),
    Chimney(47, 0, length: 17, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: 'tutorial-problem',answer: ['2'],maxLength: 1,problem: [
    BlackBoard(50, 5, 9, 5, status:  FrameStatus.soft),
    Sentence(51, 7, str: '1+1 = ', direction: SentenceDirection.horizontal),
    InputField(57, 7),
    InputBlock(52, 12, inputText: '3'),
    InputBlock(55, 12, inputText: '2'),
    InputBlock(58, 12, inputText: 'u'),
    for(double j=0;j<14;j++)
    LockedBlock(62, 3+j)
  ]),
 ]),
 platforms: PlatformLayer([
   Grnd(status: GrndStatus.rectangle,gridPoints: [Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19)]),
   Mass(58, 0, w: 9, h: 3, status:MassBlockStatus.normal)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(23, 16,status: SimpleMoveEnemyStatus.aligator, interval: 3),
  SimpleMoveEnemy(34, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 2)
 ]),
 decorations: DecorationLayer([
  Decoration(3, 16, status: DecorationStatus.bSignboard),
  RandomDecoration(4, 16, w: 71, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '0-2', direction: SentenceDirection.horizontal)
 ])
 );

 //stage３
 final stage3 = StageComponents(
  3,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(9, 0, length: 17, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 18, direction: ChimneyDirection.vertical),
    Chimney(57, 0, length: 5, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-3',answer: ['18'],maxLength: 2,problem: [
    BlackBoard(25, 3, 10, 5, status:  FrameStatus.soft),
    Sentence(26, 5, str: '9+9 = ', direction: SentenceDirection.horizontal),
    InputField(32, 5),
    InputBlock(25, 14, inputText: '3'),
    InputBlock(29, 14, inputText: '8'),
    InputBlock(33, 14, inputText: '1'),
    InputBlock(37, 14, inputText: 'u'),
    for(double j=0;j<5;j++)
    LockedBlock(47, j)
  ]),
 ]),
 platforms: PlatformLayer([
   Grnd(status: GrndStatus.rectangle,gridPoints: [Vector2(0, 19),Vector2(0, 17),Vector2(10, 17),Vector2(10, 19)]),
   Grnd(status: GrndStatus.rectangle,gridPoints: [Vector2(19, 19),Vector2(19, 18),Vector2(43, 18),Vector2(43, 19)]),
   Grnd(status: GrndStatus.rectangle,gridPoints: [Vector2(47, 19),Vector2(47, 5),Vector2(74, 5),Vector2(74, 19)]),
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(24, 17,status: SimpleMoveEnemyStatus.aligator, interval: 3),
  SimpleMoveEnemy(34, 17,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(53, 4,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(63, 4,status: SimpleMoveEnemyStatus.slime, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(43, 17),
  GoalBlock(72, 4, stageIndex: 3)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 11, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(19, 17, w: 25, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(47, 4, w: 28, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-3', direction: SentenceDirection.horizontal)
 ])
 );

 //stage4
 final stage4 = StageComponents(
  4,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(11, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-4',answer: ['17'],maxLength: 2,problem: [
    BlackBoard(48, 4, 11, 5, status:  FrameStatus.soft),
    Sentence(49, 6, str: '20-3 = ', direction: SentenceDirection.horizontal),
    InputField(56, 6),
    InputBlock(48, 12, inputText: '1'),
    InputBlock(51, 12, inputText: '8'),
    InputBlock(54, 12, inputText: '7'),
    InputBlock(57, 12, inputText: 'u'),
    for(double j=0;j<20;j++)
    LockedBlock(63, j)
  ]),
 ]),
 platforms: PlatformLayer([
   Platform(1, 15, length: 6,fallable: false),
   Platform(12, 11, length: 7,fallable: false),
   Platform(24, 14, length: 8,fallable: false),
   Platform(39, 17, length: 21,fallable: false),
   Platform(64, 13, length: 3,fallable: false),
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(16, 10,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(28, 13,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(28, 13,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(44, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(54, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(65, 12, stageIndex: 4)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(1, 14, w: 6, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(12, 10, w: 7, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(24, 13, w: 8, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(39, 16, w: 21, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-4', direction: SentenceDirection.horizontal)
 ])
 );

  //stage5
 final stage5 = StageComponents(
  5,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(12, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(46, 0, length: 15, direction: ChimneyDirection.vertical),
    Chimney(67, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-5',answer: ['7'],maxLength: 1,problem: [
    BlackBoard(40, 2, 15, 5, status:  FrameStatus.soft),
    Sentence(41, 4, str: '10+3-6 = ', direction: SentenceDirection.horizontal),
    InputField(50, 4),
    InputBlock(43, 12, inputText: '4'),
    InputBlock(47, 12, inputText: '7'),
    InputBlock(51, 12, inputText: 'u'),
    
    for(double j=0;j<8;j++)
    LockedBlock(69, j)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 15),Vector2(8, 15),Vector2(8, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(15, 19),Vector2(15, 10),Vector2(18, 10),Vector2(18, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(28, 19),Vector2(28, 10),Vector2(31, 10),Vector2(31, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(40, 19),Vector2(40, 15),Vector2(55, 15),Vector2(55, 19)
  ]),
  Platform(69, 8, length: 6,fallable: false)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(11, 9,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(23, 5,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(36, 9,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(45, 14,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(50, 14,status: SimpleMoveEnemyStatus.slime, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(55, 14),
  GoalBlock(72, 7, stageIndex: 5)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 14, w: 9, status: DecorationStatus.grass, prob: 0.2),
  RandomDecoration(15, 9, w: 4, status: DecorationStatus.grass, prob: 0.2),
  RandomDecoration(28, 9, w: 4, status: DecorationStatus.grass, prob: 0.2),
  RandomDecoration(40, 14, w: 16, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-5', direction: SentenceDirection.horizontal)
 ])
 );

   //stage6
 final stage6 = StageComponents(
  6,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(20, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(37, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-6',answer: ['7'],maxLength: 1,problem: [
    BlackBoard(41, 2, 11, 6, status:  FrameStatus.soft),
    Sentence(42, 4, str: '3+X = 10', direction: SentenceDirection.horizontal),
    Sentence(43, 6, str: 'X = ', direction: SentenceDirection.horizontal),
    InputField(47, 6),
    InputBlock(43, 13, inputText: '5'),
    InputBlock(46, 13, inputText: '7'),
    InputBlock(49, 13, inputText: 'u'),
    
    for(double j=0;j<20;j++)
    LockedBlock(65, j)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(15, 17),Vector2(15, 19)
  ]),
  Platform(19, 8, length: 3,fallable: true),
  Platform(25, 4, length: 3,fallable: true),
  Platform(32, 8, length: 3,fallable: true),
  Platform(40, 16, length:13 , fallable: false),
  Platform(67, 18, length: 6, fallable: false)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(5, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(9, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(13, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(23, 6,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(29, 6,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(37, 6,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(43, 15,status: SimpleMoveEnemyStatus.aligator, interval: 3),
  SimpleMoveEnemy(49, 15,status: SimpleMoveEnemyStatus.aligator, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(15, 16),
  GoalBlock(70, 17, stageIndex: 6)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 15, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(40, 15, w: 13, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-6', direction: SentenceDirection.horizontal)
 ])
 );

    //stage7
 final stage7 = StageComponents(
  7,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(12, 0, length: 18, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 18, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 18, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-7',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(40, 10, 10, 6, status:  FrameStatus.soft),
    Sentence(41, 12, str: '10-X = 4', direction: SentenceDirection.horizontal),
    Sentence(42, 14, str: 'X = ', direction: SentenceDirection.horizontal),
    InputField(46, 14),
    InputBlock(41, 6, inputText: '5'),
    InputBlock(44, 6, inputText: '6'),
    InputBlock(47, 6, inputText: 'u'),
    
    for(double j=0;j<6;j++)
    LockedBlock(70, j)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 18),Vector2(74, 18),Vector2(74, 19)
  ]),
  Platform(2, 13, length: 3,fallable: true),
  Platform(22, 11, length: 3,fallable: true),
  Platform(29, 8, length: 3,fallable: true),
  Platform(13, 14, length:5 , fallable: false),
  Platform(40, 9, length:10 , fallable: false),
  Platform(71, 5, length:3 , fallable: false),
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(15, 13,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(42, 8,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(46, 8,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(25, 6,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(34, 6,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(53, 11,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(57, 11,status: SimpleMoveEnemyStatus.bat, interval: 3),
  Dangers(0, 17, status: DangerObjectStatus.needle, length: 63, direction: DangerObjectDirection.bottom),
 Dangers(64, 17, status: DangerObjectStatus.needle, length: 11, direction: DangerObjectDirection.bottom),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HealItem(44, 8, status: HealItemStatus.apple),
  Spring(63, 17),
  GoalBlock(72, 4, stageIndex: 7)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(13, 13, w: 5, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(40, 8, w: 10, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-7', direction: SentenceDirection.horizontal)
 ])
 );

   //stage8
 final stage8 = StageComponents(
  8,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(12, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(33, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-8',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(39, 2, 13, 6, status:  FrameStatus.soft),
    Sentence(41, 4, str: '9+7-X = 10', direction: SentenceDirection.horizontal),
    Sentence(43, 6, str: 'X = ', direction: SentenceDirection.horizontal),
    InputField(47, 6),
    InputBlock(42, 13, inputText: '1'),
    InputBlock(46, 13, inputText: '6'),
    InputBlock(50, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(57, j)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(9, 17),Vector2(9, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(17, 19),Vector2(17, 13),Vector2(20, 13),Vector2(20, 19)
  ]),
  Platform(24, 11, length:6 , fallable: false),
  Platform(36, 17, length:22 , fallable: false),
  Platform(63, 12, length:3 , fallable: true),
  Platform(67, 10, length:3 , fallable: true),
  Platform(70, 5, length:3 , fallable: false),
 ]),
 enemies: EnemyLayer([
  Dangers(16, 13, status: DangerObjectStatus.needle, length:7 , direction: DangerObjectDirection.right),
  Dangers(21, 13, status: DangerObjectStatus.needle, length:7 , direction: DangerObjectDirection.left),
  SimpleMoveEnemy(25, 10,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(40, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(47, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(53, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(59, 5,status: SimpleMoveEnemyStatus.bat, interval: 3),
   SimpleMoveEnemy(66, 5,status: SimpleMoveEnemyStatus.bat, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  WeaponItem(18, 12, status: BitmanWeapon.shovel),
  GoalBlock(71, 4, stageIndex: 8)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 10, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(36, 16, w: 21, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-8', direction: SentenceDirection.horizontal)
 ])
 );


  //stage9
 final stage9 = StageComponents(
  9,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(9, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(23, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-9',answer: ['9'],maxLength: 1,problem: [
    BlackBoard(40, 2, 11, 5, status:  FrameStatus.soft),
    Sentence(41, 4, str: '1→3→5→7→', direction: SentenceDirection.horizontal),
    InputField(49, 4),
    InputBlock(41, 13, inputText: '1'),
    InputBlock(44, 13, inputText: '9'),
    InputBlock(47, 13, inputText: 'u'),
    
    for(double i=0;i<21;i++)
    SpawnBlock(49+i, 16)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 16),Vector2(7, 16),Vector2(7, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(13, 19),Vector2(13, 16),Vector2(20, 16),Vector2(20, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(26, 19),Vector2(26, 16),Vector2(33, 16),Vector2(33, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(40, 19),Vector2(40, 16),Vector2(48, 16),Vector2(48, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(70, 19),Vector2(70, 12),Vector2(74, 12),Vector2(74, 19)
  ]),
  Mass(16, 15, w: 2, h: 1, status: MassBlockStatus.xBlock),
  Mass(29, 15, w: 2, h: 1, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  Dangers(13, 15, status: DangerObjectStatus.needle, length:3 , direction: DangerObjectDirection.bottom),
  Dangers(18, 15, status: DangerObjectStatus.needle, length:3 , direction: DangerObjectDirection.bottom),
  Dangers(26, 15, status: DangerObjectStatus.needle, length:3 , direction: DangerObjectDirection.bottom),
  Dangers(31, 15, status: DangerObjectStatus.needle, length:3 , direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(17, 14,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(30, 14,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(9, 12,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(23, 12,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(36, 12,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(42, 15,status: SimpleMoveEnemyStatus.aligator, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HealItem(45, 15, status: HealItemStatus.pear),
  GoalBlock(72, 11, stageIndex: 9)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 15, w: 8, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(40, 15, w: 9, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-9', direction: SentenceDirection.horizontal)
 ])
 );

  //stage10
 final stage10 = StageComponents(
  10,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(13, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(31, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(56, 0, length: 17, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-10',answer: ['5'],maxLength: 1,problem: [
    BlackBoard(50, 2, 11, 5, status:  FrameStatus.soft),
    Sentence(51, 4, str: '9→7→', direction: SentenceDirection.horizontal),
    InputField(55, 4),
    Sentence(56, 4, str: '→3→1', direction: SentenceDirection.horizontal),
    InputBlock(51, 13, inputText: '8'),
    InputBlock(54, 13, inputText: '5'),
    InputBlock(57, 13, inputText: 'u'),

    for(double i=0;i<3;i++)
    SpawnBlock(64+i, 13),
    for(double i=0;i<3;i++)
    SpawnBlock(67+i, 10)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 16),Vector2(6, 16),Vector2(6, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(42, 19),Vector2(42, 3),Vector2(44, 3),Vector2(44, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(46, 19),Vector2(46, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Platform(10, 14, length: 3, fallable: true),
  Platform(15, 12, length: 3, fallable: true),
  Platform(20, 10, length: 3, fallable: true),
  Platform(35, 3, length: 3, fallable: true),
  Platform(24, 18, length: 3, fallable: false),
  Platform(71, 6, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Dangers(41, 3, status: DangerObjectStatus.needle, length:17 , direction: DangerObjectDirection.right),
  Dangers(45, 3, status: DangerObjectStatus.needle, length:17 , direction: DangerObjectDirection.left),
  SimpleMoveEnemy(13, 8,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(18, 8,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(23, 8,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(30, 5,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(39, 8,status: SimpleMoveEnemyStatus.bat, interval: 3),
  SimpleMoveEnemy(43, 2,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(49, 16,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(53, 16,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(57, 16,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(61, 16,status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(65, 16,status: SimpleMoveEnemyStatus.slime, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(25, 17),
  GoalBlock(72, 5, stageIndex: 10)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 15, w: 7, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(46, 16, w: 29, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-10', direction: SentenceDirection.horizontal)
 ])
 );

  //stage11
 final stage11 = StageComponents(
  11,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(9, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(23, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(39, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-11',answer: ['22'],maxLength: 2,problem: [
    BlackBoard(42, 2, 12, 5, status:  FrameStatus.soft),
    Sentence(43, 4, str: '12+10 = ', direction: SentenceDirection.horizontal),
    InputField(51, 4),
    InputBlock(43, 13, inputText: '1'),
    InputBlock(46, 13, inputText: '5'),
    InputBlock(49, 13, inputText: '2'),
    InputBlock(52, 13, inputText: 'u'),

    for(double i=0;i<19;i++)
    SpawnBlock(56+i, 18),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 16),Vector2(6, 16),Vector2(6, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(33, 19),Vector2(33, 5),Vector2(35, 5),Vector2(35, 19)
  ]),
  Platform(11, 15, length: 3, fallable: false),
  Platform(16, 13, length: 3, fallable: false),
  Platform(21, 10, length: 3, fallable: false),
  Platform(26, 7, length: 3, fallable: false),
  Platform(41, 18, length: 15, fallable: false),
  Platform(72, 15, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(11, 14,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(16, 12,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(21, 9,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(26, 6,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  Dangers(33, 4, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(43, 17,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(46, 17,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(49, 17,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(52, 17,status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HelmetItem(4, 15, status: BitmanHelmet.hardHat),
  WeaponItem(6, 15, status: BitmanWeapon.shovel),
  GoalBlock(73, 14, stageIndex: 11)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(41, 17, w: 15, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-11', direction: SentenceDirection.horizontal)
 ])
 );

 //stage12
 final stage12 = StageComponents(
  12,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(9, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(33, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-12',answer: ['8'],maxLength: 1,problem: [
    BlackBoard(47, 2, 12, 5, status:  FrameStatus.soft),
    Sentence(48, 4, str: '20-12 = ', direction: SentenceDirection.horizontal),
    InputField(56, 4),
    InputBlock(48, 14, inputText: '8'),
    InputBlock(52, 14, inputText: '5'),
    InputBlock(56, 14, inputText: 'u'),

    for(double j=0;j<20;j++)
    LockedBlock(63, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Platform(2, 17, length: 3, fallable: false),
  Platform(9, 13, length: 3, fallable: false),
  Platform(16, 17, length: 3, fallable: false),
  Platform(23, 13, length: 3, fallable: false),
  Platform(30, 17, length: 3, fallable: false),
  Platform(44, 17, length: 17, fallable: false),
  Platform(72, 17, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Emitter(6, 3, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.5),
  Emitter(13, 3, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.5),
  Emitter(20, 3, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.5),
  Emitter(27, 3, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.5),
  SimpleMoveEnemy(3, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(10, 12,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(17, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(24, 12,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(31, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(48, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
  SimpleMoveEnemy(55, 16,status: SimpleMoveEnemyStatus.aligator, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 16, stageIndex: 12)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(44, 16, w: 17, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-12', direction: SentenceDirection.horizontal)
 ])
 );

//stage13
 final stage13 = StageComponents(
  13,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(29, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(44, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-13',answer: ['25'],maxLength: 2,problem: [
    BlackBoard(48, 2, 15, 5, status:  FrameStatus.soft),
    Sentence(49, 4, str: '20+17-12 = ', direction: SentenceDirection.horizontal),
    InputField(60, 4),
    InputBlock(51, 13, inputText: '2'),
    InputBlock(54, 13, inputText: '3'),
    InputBlock(57, 13, inputText: '5'),
    InputBlock(60, 13, inputText: 'u'),
    for(double i=0;i<3;i++)
    SpawnBlock(64+i, 16),
     for(double i=0;i<3;i++)
    SpawnBlock(67+i, 11),
     for(double i=0;i<3;i++)
    SpawnBlock(70+i, 6),

  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(6, 17),Vector2(6, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(9, 19),Vector2(9, 4),Vector2(11, 4),Vector2(11, 19)
  ]),
  Platform(49, 17, length: 14, fallable: false)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(13, 13,status: SimpleMoveEnemyStatus.bat, interval: 2),
  SimpleMoveEnemy(19, 13,status: SimpleMoveEnemyStatus.bat, interval: 2),
  SimpleMoveEnemy(25, 13,status: SimpleMoveEnemyStatus.bat, interval: 2),
  SimpleMoveEnemy(31, 13,status: SimpleMoveEnemyStatus.bat, interval: 2),
  SimpleMoveEnemy(37, 13,status: SimpleMoveEnemyStatus.bat, interval: 2),
  Skelton(53, 16, status: SkeltonStatus.normal, interval: 2),
  Skelton(59, 16, status: SkeltonStatus.normal, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(6, 16),
  HealItem(49, 16, status: HealItemStatus.pear),
  GoalBlock(71, 5, stageIndex: 13)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(49, 16, w: 14, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-13', direction: SentenceDirection.horizontal)
 ])
 );

 //stage14
 final stage14 = StageComponents(
  14,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(10, 10, length: 10, direction: ChimneyDirection.vertical),
    Chimney(30, 10, length: 10, direction: ChimneyDirection.vertical),
    Chimney(51, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
   Problem(id: '1-14',answer: ['11'],maxLength: 2,problem: [
    BlackBoard(45, 3, 11, 6, status:  FrameStatus.soft),
    Sentence(46, 5, str: '11+X = 22', direction: SentenceDirection.horizontal),
    Sentence(49, 7, str: 'X = ', direction: SentenceDirection.horizontal),
    InputField(53, 7),
    InputBlock(46, 14, inputText: '2'),
    InputBlock(50, 14, inputText: '1'),
    InputBlock(54, 14, inputText: 'u'),
    for(double i=0;i<4;i++)
    SpawnBlock(66+i, 18),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(7, 0),Vector2(7, 9),Vector2(42, 9),Vector2(42, 0)
  ]),
  Platform(2, 15, length: 3, fallable: false),
  for(var i=0;i<6;i++)
  Platform(7 + i*6, 13, length: 3, fallable: false),
  Platform(45, 17, length: 12, fallable: false),
  Platform(72, 15, length: 3, fallable: false),
  Platform(72, 10, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
   for(var i=0;i<6;i++)
  SimpleMoveEnemy(8 + i*6, 12,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(46, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(50, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(54, 16,status: SimpleMoveEnemyStatus.slime, interval: 2),
  Dangers(7, 10, status: DangerObjectStatus.needle, length: 36, direction: DangerObjectDirection.top)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 9, stageIndex: 14)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(45, 16, w: 12, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-14', direction: SentenceDirection.horizontal)
 ])
 );

  //stage15
 final stage15 = StageComponents(
  15,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(11, 10, length: 5, direction: ChimneyDirection.vertical),
    Chimney(30, 10, length: 5, direction: ChimneyDirection.vertical),
    Chimney(45, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-15',answer: ['25'],maxLength: 2,problem: [
    BlackBoard(49, 3, 11, 6, status:  FrameStatus.soft),
    Sentence(50, 5, str: 'X-12 = 13', direction: SentenceDirection.horizontal),
    Sentence(53, 6, str: 'X = ', direction: SentenceDirection.horizontal),
   InputField(57, 6),
    InputBlock(50, 13, inputText: '2'),
    InputBlock(53, 13, inputText: '8'),
    InputBlock(56, 13, inputText: '5'),
    InputBlock(59, 13, inputText: 'u'),
    for(double j=0;j<20;j++)
    LockedBlock(66, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(0, 0),Vector2(0, 9),Vector2(31, 9),Vector2(31, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 15),Vector2(31, 15),Vector2(31, 19)
  ]),
  Platform(49, 17, length: 12, fallable: false),
  Platform(68, 17, length: 7, fallable: false),
 ]),
 enemies: EnemyLayer([
  for(var i=0;i<8;i++)
  Emitter(2 + i*4, 5, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 3.0-i/10),
  Skelton(53, 5, status: SkeltonStatus.bug, interval: 3),
  Skelton(57, 5, status: SkeltonStatus.bug, interval: 3),
  
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(31, 14),
  GoalBlock(71, 16, stageIndex: 15)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 14, w: 32, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(49, 16, w: 12, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-15', direction: SentenceDirection.horizontal)
 ])
 );

   //stage16
 final stage16 = StageComponents(
  16,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(10, 0, length: 14, direction: ChimneyDirection.vertical),
    Chimney(26, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(47, 0, length: 17, direction: ChimneyDirection.vertical),
    Chimney(68, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-16',answer: ['28'],maxLength: 2,problem: [
    BlackBoard(46, 2, 14, 6, status:  FrameStatus.soft),
    Sentence(47, 4, str: '12+X-10 = 30', direction: SentenceDirection.horizontal),
    Sentence(53, 6, str: 'X = ', direction: SentenceDirection.horizontal),
    InputField(57, 6),
    InputBlock(48, 13, inputText: '8'),
    InputBlock(51, 13, inputText: '1'),
    InputBlock(54, 13, inputText: '2'),
    InputBlock(57, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(62, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(5, 17),Vector2(5, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(9, 19),Vector2(9, 14),Vector2(12, 14),Vector2(12, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(16, 19),Vector2(16, 3),Vector2(18, 3),Vector2(18, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(40, 19),Vector2(40, 3),Vector2(42, 3),Vector2(42, 19)
  ]),
  for(var j=0;j<3;j++)
  Platform(19, 8 + j*4, length: 3, fallable: true),
  for(var j=0;j<3;j++)
  Platform(37, 8 + j*4, length: 3, fallable: true),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(45, 19),Vector2(45, 17),Vector2(62, 17),Vector2(62, 19)
  ]),
  Platform(72, 14, length: 3, fallable: false),
  Platform(72, 10, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Emitter(17, 10, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.right, interval: 1.0),
  Emitter(41, 6, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.left, interval: 2.0),
  Emitter(41, 14, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.left, interval: 2.0),
  for(var i=0;i<3;i++)
  SimpleMoveEnemy(48+i*5, 16, status: SimpleMoveEnemyStatus.aligator, interval: 3)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  Spring(12, 13),
  GoalBlock(73, 9, stageIndex: 16)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 6, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(45, 16, w: 17, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(16, 2, w: 3, status: DecorationStatus.grass, prob: 0.1),
  RandomDecoration(40, 2, w: 3, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-16', direction: SentenceDirection.horizontal)
 ])
 );

    //stage17
 final stage17 = StageComponents(
  17,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(13, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(53, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-17',answer: ['60'],maxLength: 2,problem: [
    BlackBoard(49, 3, 15, 5, status:  FrameStatus.soft),
    Sentence(50, 5, str: '10+33+17 = ', direction: SentenceDirection.horizontal),
    InputField(61, 5),
    InputBlock(51, 11, inputText: '8'),
    InputBlock(54, 11, inputText: '0'),
    InputBlock(57, 11, inputText: '6'),
    InputBlock(60, 11, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(71, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(0, 0),Vector2(0, 6),Vector2(6, 6),Vector2(6, 0),
  ] ),
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(7, 0),Vector2(7, 15),Vector2(8, 15),Vector2(8, 0),
  ] ),
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(24, 0),Vector2(24, 7),Vector2(28, 7),Vector2(28, 0),
  ] ),
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(40, 0),Vector2(40, 14),Vector2(42, 14),Vector2(42, 0),
  ] ),
  Platform(0, 14, length: 5, fallable: false),
  Platform(9, 6, length: 3, fallable: false),
  Platform(17, 5, length: 5, fallable: false),
  Platform(13, 9, length: 5, fallable: false,path: Path()..lineTo(0, 16*5)),
  Platform(8, 17, length: 4, fallable: false,path: Path()..lineTo(16*4, 0)),
  Platform(28, 15, length: 3, fallable: false,path: Path()..lineTo(0,-16*5)),
  Platform(36, 17, length: 7, fallable: false,path: Path()..lineTo(16*3, 0)),
  Breakables(5, 7, w: 1, h: 8, status: BreakableBlockStatus.normal),
  Breakables(21, 0, w: 1, h: 5, status: BreakableBlockStatus.normal),
  Breakables(33, 0, w: 1, h: 6, status: BreakableBlockStatus.normal),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(18, 19),Vector2(18, 6),Vector2(20, 6),Vector2(20, 19),
  ] ),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(31, 19),Vector2(31, 6),Vector2(33, 6),Vector2(33, 19),
  ] ),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(46, 19),Vector2(46, 15),Vector2(74, 15),Vector2(74, 19),
  ] ),
  Mass(17, 2, w: 1, h: 3, status:MassBlockStatus.xBlock)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(10, 5, status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(19, 4, status: SimpleMoveEnemyStatus.slime, interval: 3),
  for(var i=0;i<3;i++)
  SimpleMoveEnemy(13+i*13, 9, status: SimpleMoveEnemyStatus.bat, interval: 3),
  for(var i=0;i<4;i++)
  SimpleMoveEnemy(51+i*3, 14, status: SimpleMoveEnemyStatus.slime, interval: 3)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HealItem(31, 5, status: HealItemStatus.apple),
  GoalBlock(73, 14, stageIndex: 17)
 ]),
 decorations: DecorationLayer([
  
  RandomDecoration(46, 14, w: 25, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-17', direction: SentenceDirection.horizontal)
 ])
 );

     //stage18
 final stage18 = StageComponents(
  18,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(19, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(41, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-18',answer: ['35'],maxLength: 2,problem: [
    BlackBoard(48, 3, 15, 5, status:  FrameStatus.soft),
    Sentence(49, 5, str: '73-15-23 = ', direction: SentenceDirection.horizontal),
    InputField(60, 5),
    InputBlock(50, 13, inputText: '2'),
    InputBlock(53, 13, inputText: '5'),
    InputBlock(56, 13, inputText: '3'),
    InputBlock(59, 13, inputText: 'u'),
    for(double j=0;j<18;j++)
    LockedBlock(63, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(2, 19),Vector2(2, 15),Vector2(4, 15),Vector2(4, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(47, 19),Vector2(47, 18),Vector2(63, 18),Vector2(63, 19)]),
  Platform(7, 5, length: 3, fallable: false,path: Path()..addPolygon(const [
    Offset(0, 0),Offset(0, 16*11),Offset(16*33, 16*11),Offset(16*33, 0),
  ], true),pathAlternate: false,pathDuration: 80),
  Platform(38, 16, length: 3, fallable: false,path: Path()..addPolygon(const [
    Offset(0, 0),Offset(0, -16*11),Offset(-16*33, -16*11),Offset(-16*33, 0),
  ], true),pathAlternate: false,pathDuration: 80),
  Platform(66, 15, length: 3, fallable: false),
  Platform(72, 12, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<6;i++)
  Emitter(10+6*i, 19, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.top, interval: 1.0+Random().nextDouble()),
  for(double i=0;i<7;i++)
  Emitter(7+6*i, 0, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.0+Random().nextDouble()),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(50+i*3, 17, status: SimpleMoveEnemyStatus.slime, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 11, stageIndex: 18)
 ]),
 decorations: DecorationLayer([
  
  RandomDecoration(47, 17, w: 15, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-18', direction: SentenceDirection.horizontal)
 ])
 );

 //stage19
 final stage19 = StageComponents(
  19,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(20, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(40, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(66, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-19',answer: ['64'],maxLength: 2,problem: [
    BlackBoard(48, 3, 13, 5, status:  FrameStatus.soft),
    Sentence(49, 5, str: '16→32→48→', direction: SentenceDirection.horizontal),
    InputField(58, 5),
    InputBlock(50, 13, inputText: '4'),
    InputBlock(53, 13, inputText: '0'),
    InputBlock(56, 13, inputText: '6'),
    InputBlock(59, 13, inputText: 'u'),
    for(double j=0;j<18;j++)
    LockedBlock(63, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(2, 19),Vector2(2, 15),Vector2(3, 15),Vector2(3, 19)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(21, 0),Vector2(21, 10),Vector2(23, 10),Vector2(23, 0)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(21, 19),Vector2(21, 13),Vector2(23, 13),Vector2(23, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(38, 19),Vector2(38, 4),Vector2(40, 4),Vector2(40, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(47, 19),Vector2(47, 18),Vector2(63, 18),Vector2(63, 19)]),
  Platform(9, 10, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(16*3, 0), radius: 16*3), pi, 2*pi)
  ,pathAlternate: false,pathDuration: 10),
  Platform(15, 10, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(-16*3, 0), radius: 16*3),0,2*pi)
  ,pathAlternate: false,pathDuration: 10),
  Platform(25, 15, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(16*3, 0), radius: 16*3), pi, 2*pi)
  ,pathAlternate: false,pathDuration: 10),
  Platform(31, 15, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(-16*3, 0), radius: 16*3),0,2*pi)
  ,pathAlternate: false,pathDuration: 10),
  Platform(25, 7, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(16*3, 0), radius: 16*3), pi, -2*pi)
  ,pathAlternate: false,pathDuration: 8),
  Platform(31, 7, length: 3, fallable: false,path: Path()..addArc(Rect.fromCircle(center: const Offset(-16*3, 0), radius: 16*3),0,-2*pi)
  ,pathAlternate: false,pathDuration: 8),
  Platform(72, 12, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Dangers(15, 9, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom,path: Path()..addArc(Rect.fromCircle(center: const Offset(-16*3, 0), radius: 16*3),0,2*pi),pathAlternate: false,pathDuration: 10),
  Dangers(25, 14, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom,path: Path()..addArc(Rect.fromCircle(center: const Offset(16*3, 0), radius: 16*3), pi, 2*pi)
  ,pathAlternate: false,pathDuration: 10),
  Dangers(31, 6, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom,path: Path()..addArc(Rect.fromCircle(center: const Offset(-16*3, 0), radius: 16*3),0,-2*pi)
  ,pathAlternate: false,pathDuration: 8),
  Skelton(21, 12, status: SkeltonStatus.normal, interval: 2),
  Skelton(38, 3, status: SkeltonStatus.normal, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(50+i*3, 17, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(66+i*2, 15, status: SimpleMoveEnemyStatus.bat, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 11, stageIndex: 19)
 ]),
 decorations: DecorationLayer([
  
  RandomDecoration(47, 17, w: 15, status: DecorationStatus.grass, prob: 0.1),
  Sentence(2, 2, str: '1-19', direction: SentenceDirection.horizontal)
 ])
 );

 //stage20
 final stage20 = StageComponents(
  20,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(19, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(40, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-20',answer: ['20'],maxLength: 2,problem: [
    BlackBoard(48, 3, 13, 5, status:  FrameStatus.soft),
    Sentence(49, 5, str: '80→60→40→', direction: SentenceDirection.horizontal),
    InputField(58, 5),
    InputBlock(50, 13, inputText: '4'),
    InputBlock(53, 13, inputText: '0'),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: 'u'),
    for(double j=0;j<18;j++)
    LockedBlock(63, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(0, 19),Vector2(0, 15),Vector2(9, 15),Vector2(9, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(13, 19),Vector2(13, 4),Vector2(16, 4),Vector2(16, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(20, 19),Vector2(20, 12),Vector2(23, 12),Vector2(23, 19)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(20, -5),Vector2(20, 9),Vector2(23, 9),Vector2(23, -5)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(27, 19),Vector2(27, 5),Vector2(30, 5),Vector2(30, 19)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(27, -5),Vector2(27, 2),Vector2(30, 2),Vector2(30, -5)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(34, 19),Vector2(34, 18),Vector2(37, 18),Vector2(37, 19)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(34, -5),Vector2(34, 15),Vector2(37, 15),Vector2(37, -5)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(41, -5),Vector2(41, 15),Vector2(46, 15),Vector2(46, -5)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(47, 19),Vector2(47, 18),Vector2(63, 18),Vector2(63, 19)]),
  for(var i=0;i<5;i++)
  Platform(10+ i*7, 19, length: 3, fallable: false,pathAlternate: false
  ,path: Path()..addPolygon(const[Offset(0, 0),Offset(0, -20*16)], false),pathDuration: 10),
  Platform(64, 10, length: 3, fallable: false),
  Platform(72, 12, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Skelton(13, 3, status: SkeltonStatus.horn, interval: 3),
  Skelton(20, 11, status: SkeltonStatus.horn, interval: 3),
  Skelton(27, 4, status: SkeltonStatus.horn, interval: 3),
  Skelton(34, 17, status: SkeltonStatus.horn, interval: 3),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(50+i*3, 17, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 11, stageIndex: 20)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 2, str: '1-20', direction: SentenceDirection.horizontal)
 ])
 );

//stage21
 final stage21 = StageComponents(
  21,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(19, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(42, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-21',answer: ['50'],maxLength: 2,problem: [
    BlackBoard(48, 3, 13, 5, status:  FrameStatus.soft),
    Sentence(51, 5, str: '→35→20→5', direction: SentenceDirection.horizontal),
    InputField(49, 5),
    InputBlock(50, 13, inputText: '5'),
    InputBlock(53, 13, inputText: '0'),
    InputBlock(56, 13, inputText: '1'),
    InputBlock(59, 13, inputText: 'u'),
    for(double j=0;j<18;j++)
    LockedBlock(63, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(0, 19),Vector2(0, 15),Vector2(9, 15),Vector2(9, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(34, 19),Vector2(34, 4),Vector2(36, 4),Vector2(36, 19)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(39, 0),Vector2(39, 12),Vector2(41, 12),Vector2(41, 0)]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [Vector2(42, 0),Vector2(42, 9),Vector2(46, 9),Vector2(46, 0)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(45, 19),Vector2(45, 12),Vector2(46, 12),Vector2(46, 19)]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [Vector2(47, 19),Vector2(47, 18),Vector2(63, 18),Vector2(63, 19)]),
  ScalableBlock(14, 15),
  ScalableBlock(18, 12),
  ScalableBlock(22, 15),
  ScalableBlock(26, 12),
  for(double j=0;j<3;j++)
  ScalableBlock(33, 7+j*4,basisAnchor: ScalableBlockAnchor.right),
  Platform(37, 15, length: 8, fallable: true),
  Platform(72, 12, length: 3, fallable: false)
 ]),
 enemies: EnemyLayer([

  for(double i=0;i<4;i++)
  SimpleMoveEnemy(50+i*3, 17, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(14, 14, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(22, 14, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(18, 11, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(26, 11, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double j=0;j<3;j++)
  SimpleMoveEnemy(33, 6+ j*4, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(68, 14, status: SimpleMoveEnemyStatus.bat, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 11, stageIndex: 21)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 2, str: '1-21', direction: SentenceDirection.horizontal)
 ])
 );

 //stage22
 final stage22 = StageComponents(
  22,
 background:BackgroundLayer(),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(19, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(41, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '1-22-1',answer: ['51'],maxLength: 2,problem: [
    BlackBoard(34, 4, 13, 5, status:  FrameStatus.soft),
    Sentence(35, 6, str: '17→34→', direction: SentenceDirection.horizontal),
    InputField(41, 6),
    Sentence(43, 6, str: '→68', direction: SentenceDirection.horizontal),
    InputBlock(34, 12, inputText: '1'),
    InputBlock(38, 12, inputText: '5'),
    InputBlock(42, 12, inputText: '3'),
    InputBlock(46, 12, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(52, 2+j),
    for(double j=0;j<3;j++)
    LockedBlock(48, 14+j),
    for(double i=0;i<4;i++)
    LockedBlock(48+i, 13)
  ]),
    Problem(id: '1-22-2',answer: ['15'],maxLength: 2,problem: [
    BlackBoard(54, 3, 15, 6, status:  FrameStatus.soft),
    Sentence(56, 4, str: '12+X = 27', direction: SentenceDirection.horizontal),
    Sentence(57, 5, str: 'X+Y = 30', direction: SentenceDirection.horizontal),
    Sentence(59, 7, str: 'Y = ', direction: SentenceDirection.horizontal),
    InputField(63, 7),
    InputBlock(55, 12, inputText: '1'),
    InputBlock(58, 12, inputText: '3'),
    InputBlock(61, 12, inputText: '5'),
    InputBlock(64, 12, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(70, 2+j),
    for(double j=0;j<3;j++)
    LockedBlock(66, 14+j),
    for(double i=0;i<4;i++)
    LockedBlock(66+i, 13)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 1),Vector2(74, 1),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(3, 17),Vector2(3, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(25, 19),Vector2(25, 17),Vector2(29, 17),Vector2(29, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(48, 19),Vector2(48, 17),Vector2(52, 17),Vector2(52, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(66, 19),Vector2(66, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Mass(4, 19, w: 21, h: 1, status: MassBlockStatus.xBlock),
  Platform(4, 17, length: 21, fallable: false),
  Mass(30, 19, w: 18, h: 1, status: MassBlockStatus.xBlock),
  Platform(30, 17, length: 18, fallable: true),
  Mass(53, 19, w: 13, h: 1, status: MassBlockStatus.xBlock),
  ScalableBlock(59, 17,initialAmount: 1,scaleAmount: 4,scaleDuration: 1.5)
 ]),
 enemies: EnemyLayer([
  Dangers(4, 18, status: DangerObjectStatus.fire, length: 21, direction: DangerObjectDirection.bottom),
  Dangers(30, 18, status: DangerObjectStatus.fire, length: 18, direction: DangerObjectDirection.bottom),
  Dangers(53, 18, status: DangerObjectStatus.fire, length: 13, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(8+ i*4, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(36+ i*4, 12, status: SimpleMoveEnemyStatus.bat, interval: 2,abnormalStatus: AbnormalStatus.stun),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HealItem(27, 16, status: HealItemStatus.apple),
  HealItem(50, 16, status: HealItemStatus.apple),
  HealItem(68, 16, status: HealItemStatus.apple),
  Entrance(73, 16, stageIndex: -1, status: EntranceBlockStatus.open)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 2, str: '1-22', direction: SentenceDirection.horizontal)
 ])
 );

  //bossStage1
 final bossStage1 = StageComponents(
  -1,
 background:BackgroundLayer(status: BackgroundStatus.lava),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    for(double i=0;i<6;i++)
    Decoration(14*i, 5, status: DecorationStatus.yellowTorch)
  ]
 ),
 problems: ProblemLayer([
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 1),Vector2(74, 1),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  for(double i=0;i<3;i++)
  Platform(7 + 4*i, 14 - 4*i, length: 3, fallable: false),
  for(double i=0;i<3;i++)
  Platform(36, 14 - 4*i, length: 3, fallable: false),
  for(double i=0;i<3;i++)
  Platform(59 - 4*i, 14 - 4*i, length: 3, fallable: false),

  for(double j=0;j<15;j++)
  EnemyLockedBlock(71, 2+j)
 ]),
 enemies: EnemyLayer([
  Golem(69, 15,path: Path()..lineTo(-16*65, 0),pathDuration: 40)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HelmetItem(3, 16, status:BitmanHelmet.hardHat),
  WeaponItem(4, 16, status: BitmanWeapon.bomb),
  for(double i=0;i<3;i++)
  WeaponItem(8 + 4*i, 13 - 4*i, status: BitmanWeapon.bomb),
  for(double i=0;i<2;i++)
  WeaponItem(37, 13 - 4*i, status: BitmanWeapon.bomb),
  HealItem(37, 5, status: HealItemStatus.pear),
  for(double i=0;i<3;i++)
  WeaponItem(60 - 4*i, 13 - 4*i, status: BitmanWeapon.bomb),
  GoalBlock(73, 16, stageIndex: 22)
 ]),
 decorations: DecorationLayer([
  
 ])
 );

 //stage23
 final stage23 = StageComponents(
  23,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-23',answer: ['20'],maxLength: 2,problem: [
    BlackBoard(52, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 5, str: '5*4', direction: SentenceDirection.horizontal),
    Sentence(53, 6, str: '=5+5+5+5', direction: SentenceDirection.horizontal),
    Sentence(53, 7, str: '=', direction: SentenceDirection.horizontal),
    InputField(54, 7),
    InputBlock(53, 11, inputText: '0'),
    InputBlock(56, 11, inputText: '2'),
    InputBlock(59, 11, inputText: '5'),
    InputBlock(62, 11, inputText: 'u'),
    for(double j=0;j<14;j++)
    LockedBlock(70, 3+j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.invertedRect,
   gridPoints: [
    Vector2(0, 0),Vector2(0, 2),Vector2(74, 2),Vector2(74, 0)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(3, 17),Vector2(3, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(48, 19),Vector2(48, 17),Vector2(74, 17),Vector2(74, 19)
   ]),
  Maze(4, 5, rank: 5, amount: 44, status: MassBlockStatus.normal,isHorizontal: true,
  eraces: [
    Vector2(15, 8),Vector2(26, 8),Vector2(40, 8), Vector2(30, 11),Vector2(37, 14),Vector2(42, 14)
  ],
  adds: [
    Vector2(47, 3), Vector2(25, 6),Vector2(47, 6), Vector2(14, 9),Vector2(29, 9),Vector2(47, 9),
    Vector2(29, 12),Vector2(39, 12), Vector2(36, 15),Vector2(47, 15)
  ],
  replaces: [
    for(double i=0;i<10;i++)
    PlatformBlock(37+i, 17, status: PlatformStatus.fallable)
  ]),
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(14, 7, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(39, 7, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(32, 10, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(36, 13, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(28, 4, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(28, 13, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(28, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(53 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  
  GoalBlock(73, 16, stageIndex: 23,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(48, 16, w: 22, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-23', direction: SentenceDirection.horizontal)
 ])
 );

 //stage24
 final stage24 = StageComponents(
  24,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-24',answer: ['4'],maxLength: 1,problem: [
    BlackBoard(52, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '20/5 = ', direction: SentenceDirection.horizontal),
    InputField(61, 6),
    InputBlock(56, 11, inputText: '3'),
    InputBlock(59, 11, inputText: '4'),
    InputBlock(62, 11, inputText: 'u'),
    for(double j=0;j<14;j++)
    LockedBlock(70, 3+j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.invertedRect,
   gridPoints: [
    Vector2(0, 0),Vector2(0, 2),Vector2(74, 2),Vector2(74, 0)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(3, 17),Vector2(3, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(48, 19),Vector2(48, 17),Vector2(74, 17),Vector2(74, 19)
   ]),
  Maze(4, 5, rank: 5, amount: 44, status: MassBlockStatus.normal,isHorizontal: true,
  eraces: [
    Vector2(10, 14),Vector2(20, 14),Vector2(35, 14), Vector2(30, 11),Vector2(35, 8),Vector2(35, 5),Vector2(43, 5),
  ],
  adds: [
    Vector2(20, 3), Vector2(34, 3), Vector2(47, 3),Vector2(34, 6),Vector2(42, 6), Vector2(16, 9),Vector2(24, 9),Vector2(37, 9),
    Vector2(19, 12),Vector2(32, 12), Vector2(47, 12),Vector2(9, 15),Vector2(37, 15),
  ],
  replaces: [
  ]),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  for(double j=0;j<5;j++)
  SimpleMoveEnemy(17 + 11*i, 4 + 3*j, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 16, stageIndex: 24,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(48, 16, w: 22, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-24', direction: SentenceDirection.horizontal)
 ])
 );

  //stage25
 final stage25 = StageComponents(
  25,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-25',answer: ['21'],maxLength: 2,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '15/5*7 = ', direction: SentenceDirection.horizontal),
    InputField(63, 6),
    InputBlock(53, 11, inputText: '1'),
    InputBlock(56, 11, inputText: '3'),
    InputBlock(59, 11, inputText: '2'),
    InputBlock(62, 11, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(21, 19),Vector2(21, 4),Vector2(23, 4),Vector2(23, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(48, 19),Vector2(48, 6),Vector2(51, 6),Vector2(51, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19)
   ]),
  Platform(0, 19, length: 21, fallable: false),
  Platform(1, 14, length: 3, fallable: false),
  Platform(24, 19, length: 13, fallable: false),
  for(double i=0;i<3;i++)
  Platform(38 + 3*i, 14 - 2*i, length: 3, fallable: true),
  Mass(9, 16, w: 5, h: 3, status: MassBlockStatus.xBlock),
  Mass(16, 16, w: 5, h: 3, status: MassBlockStatus.xBlock),
  Mass(24, 14, w: 12, h: 5, status: MassBlockStatus.xBlock),
  Mass(32, 10, w: 4, h: 4, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  Skelton(10, 15, status: SkeltonStatus.normal, interval: 3),
  Skelton(25, 13, status: SkeltonStatus.normal, interval: 4),
  Skelton(33, 9, status: SkeltonStatus.horn, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(53 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Spring(19, 15),
  EndPosition(75, 0),
  GoalBlock(73, 16, stageIndex: 25,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(52, 16, w: 18, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-25', direction: SentenceDirection.horizontal)
 ])
 );

 

   //stage26
 final stage26 = StageComponents(
  26,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-26',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(55, 6, str: '3*', direction: SentenceDirection.horizontal),
    InputField(57, 6),
    Sentence(60, 6, str: '= 18', direction: SentenceDirection.horizontal),
    
    InputBlock(56, 13, inputText: '9'),
    InputBlock(59, 13, inputText: '6'),
    InputBlock(62, 13, inputText: 'u'),
    for(double i=0;i<6;i++)
    LockedBlock(69 +i, 14),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19)
   ]),
  Maze(0, 2, rank: 5, amount: 47, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<6;j++)
    Vector2(0, j*3),
    for(double j=0;j<4;j++)
    Vector2(7, 6+ j*3),
    for(double j=0;j<5;j++)
    Vector2(17,  j*3),
    for(double j=0;j<5;j++)
    Vector2(23, j*3),
    for(double j=0;j<5;j++)
    Vector2(30, 3+j*3),
    Vector2(40, 9),
    for(double j=0;j<2;j++)
    Vector2(46, j*3),
    for(double j=0;j<3;j++)
    Vector2(46,9 + j*3),
  ],
  eraces:[
    for(double j=0;j<4;j++)
    Vector2(4, 5+j*3),
    for(double j=0;j<4;j++)
    Vector2(13, 5+ j*3),
    for(double j=0;j<5;j++)
    Vector2(26, 2+ j*3),
    Vector2(32, 2),
    Vector2(41, 5),
  ] ,
  replaces: [

  ]
  ),
  Mass(69, 15, w: 2, h: 2, status: MassBlockStatus.xBlock)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  Emitter(20, 1, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.right, interval: 1.5),
  Emitter(20, 7, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.right, interval: 1.5),
  Emitter(20, 4, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.left, interval: 1.5),
  Emitter(20, 10, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.left, interval: 1.5),
  Emitter(20, 13, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 1.5)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HelmetItem(8, 4, status: BitmanHelmet.helmet),
  EndPosition(75, 0),
  GoalBlock(73, 16, stageIndex: 26,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(47, 16, w: 22, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-26', direction: SentenceDirection.horizontal)
 ])
 );

    //stage27
 final stage27 = StageComponents(
  27,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-27',answer: ['4'],maxLength: 1,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(55, 6, str: '28/', direction: SentenceDirection.horizontal),
    InputField(58, 6),
    Sentence(60, 6, str: '= 7', direction: SentenceDirection.horizontal),
    InputBlock(56, 13, inputText: '4'),
    InputBlock(59, 13, inputText: '8'),
    InputBlock(62, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(5, 19),Vector2(5, 7),Vector2(7, 7),Vector2(7, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(22, 19),Vector2(22, 7),Vector2(24, 7),Vector2(24, 19)
   ]),
  Grnd(
    status: GrndStatus.invertedRect,
   gridPoints: [
    Vector2(31, 0),Vector2(31, 10),Vector2(51, 10),Vector2(51, 0)
   ]),
  Platform(2, 9, length: 3, fallable: false),
  Platform(2, 13, length: 3, fallable: false),
  FloatingBlock(12, 11, status: FloatingBlockStatus.pentagon,initialAngle:pi),
  Platform(25, 5, length: 3, fallable: false,
  path: Path()..addPolygon(const [Offset(0, 0),Offset(2*16, 8*16),Offset(14*16, 13*16),Offset(24*16, 11*16)], false),
  pathAlternate: true,
  pathDuration: 10),
  Platform(53, 17, length: 22, fallable: false),
 
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<3;i++)
  Skelton(12+ i*20, 2, status: SkeltonStatus.propeller, interval: 5),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 27,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(53, 16, w: 17, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-27', direction: SentenceDirection.horizontal)
 ])
 );

    //stage28
 final stage28 = StageComponents(
  28,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(34, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(59, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-28',answer: ['32'],maxLength: 2,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '2→4→8→16→', direction: SentenceDirection.horizontal),
    InputField(63, 6),
    InputBlock(55, 13, inputText: '4'),
    InputBlock(58, 13, inputText: '2'),
    InputBlock(61, 13, inputText: '3'),
    InputBlock(64, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70, j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(2, 19),Vector2(2, 14),Vector2(4, 14),Vector2(4, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(9, 19),Vector2(9,17),Vector2(19,17),Vector2(19, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(70, 19),Vector2(70,17),Vector2(74,17),Vector2(74, 19)
   ]),
   Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(55, 19),Vector2(55,17),Vector2(64,17),Vector2(64, 19)
   ]),
  Grnd(
    status: GrndStatus.invertedRect,
   gridPoints: [
    Vector2(5, 0),Vector2(5, 8),Vector2(9, 8),Vector2(9, 0)
   ]),
  Mass(10, 8, w: 10, h: 1, status: MassBlockStatus.xBlock),
  for(double i=0;i<3;i++)
  Mass(22 + 8*i, 4, w: 1, h: 16, status: MassBlockStatus.xBlock),
  for(double i=0;i<3;i++)
  ScalableBlock(22+8*i, 0,basisAnchor: ScalableBlockAnchor.left,scaleAmount: 3,isHorizontal: false,scaleDuration: 2.0),
  Platform(48, 11, length: 3, fallable: false),
 
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(12, 16, status: SimpleMoveEnemyStatus.aligator, interval: 3),
  SimpleMoveEnemy(12, 7, status: SimpleMoveEnemyStatus.aligator, interval: 3),
  SimpleMoveEnemy(14, 12, status:SimpleMoveEnemyStatus.bat, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(26 + i*8, 8, status: SimpleMoveEnemyStatus.bat, interval: 3)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Spring(19, 16),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 28,)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(55, 16, w: 10, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(1, 3, str: '2-28', direction: SentenceDirection.horizontal)
 ])
 );
 

     //stage29
 final stage29 = StageComponents(
  29,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-29',answer: ['8'],maxLength: 1,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '64→32→16→', direction: SentenceDirection.horizontal),
    InputField(63, 6),
    
    InputBlock(56, 11, inputText: '7'),
    InputBlock(59, 11, inputText: '8'),
    InputBlock(62, 11, inputText: 'u'),
    for(double i=0;i<5;i++)
    SpawnBlock(67+i,8),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(0, 19),Vector2(0, 14),Vector2(5, 14),Vector2(5, 19)
   ]),
  Grnd(
    status: GrndStatus.rectangle,
   gridPoints: [
    Vector2(52, 19),Vector2(52,14),Vector2(66,14),Vector2(66, 19)
   ]),
  for(double i=0;i<4;i++)
  Platform(10 + i*10, 3, length: 3, fallable: false),
  Platform(72, 5, length: 3, fallable: false),
  FloatingBlock(10, 12, status: FloatingBlockStatus.rectangle),
  FloatingBlock(20, 10, status: FloatingBlockStatus.rectangle),
  FloatingBlock(30, 8, status: FloatingBlockStatus.rectangle),
  FloatingBlock(40, 10, status: FloatingBlockStatus.rectangle),
 ]),
 enemies: EnemyLayer([
  ReferencePoint(0, 0),
  TeleportableEnemy(10, 11, status: TeleportableEnemyStatus.miniWitch, interval: 2,
  targetPoints: [Vector2(11, 2),Vector2(21, 2),Vector2(31, 2),Vector2(41, 2)]),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 13, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(73, 4, stageIndex: 29)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(52, 13, w: 15, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-29', direction: SentenceDirection.horizontal)
 ])
 );

     //stage30
 final stage30 = StageComponents(
  30,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-30',answer: ['9'],maxLength: 1,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '81→27→', direction: SentenceDirection.horizontal),
    InputField(61, 6),
    Sentence(63, 6, str: '→3', direction: SentenceDirection.horizontal),
    InputBlock(58, 13, inputText: '9'),
    InputBlock(60, 12, inputText: '6'),
    InputBlock(62, 13, inputText: 'u'),
    for(double j=0;j<20;j++)
    LockedBlock(67,j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(6, 17),Vector2(6, 19),
  ]),
  Platform(7, 19, length: 48, fallable: false),
  Platform(7, 17, length: 5, fallable: true),
  Platform(21, 13, length: 7, fallable: false),
  Platform(40, 9, length: 7, fallable: false),
  Platform(70, 16, length: 3, fallable: false),
  Breakables(12, 17, w: 3, h: 2, status: BreakableBlockStatus.hard),
  Breakables(28, 17, w: 3, h: 2, status: BreakableBlockStatus.hard),
  Breakables(37, 17, w: 3, h: 2, status: BreakableBlockStatus.hard),
  Breakables(47, 17, w: 3, h: 2, status: BreakableBlockStatus.hard),
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(12, 13),Vector2(9, 4)
  ]),
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(28, 9),Vector2(12, 8)
  ]),
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(47, 4),Vector2(4, 13)
  ]),
  FloatingBlock(55, 16, status: FloatingBlockStatus.trapezoid)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(16, 12, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(26, 12, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(36, 8, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(46, 8, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(20 + i*9, 5, status: SimpleMoveEnemyStatus.bat, interval: 3),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(58 + i*2, 15, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(9, 18, status: BitmanWeapon.pick),
  EndPosition(75, 0),
  GoalBlock(71, 15, stageIndex: 30)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(12, 12, w: 9, status:DecorationStatus.deadTree, prob:0.1),
  RandomDecoration(0, 16, w: 6, status:DecorationStatus.deadTree, prob:0.1),
  RandomDecoration(28, 8, w: 12, status:DecorationStatus.deadTree, prob:0.1),
  RandomDecoration(47, 3, w: 4, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-30', direction: SentenceDirection.horizontal)
 ])
 );

     //stage31
 final stage31 = StageComponents(
  31,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-31',answer: ['48'],maxLength: 2,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.medium),
    Sentence(56, 8, str: '12*4 = ', direction: SentenceDirection.horizontal),
    InputField(63, 8),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: '8'),
    InputBlock(62, 13, inputText: '4'),
    InputBlock(65, 13, inputText: 'u'),
    for(double j=0;j<14;j++)
    LockedBlock(70,3+j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 2),Vector2(74, 2),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(47, 19),Vector2(47, 8),Vector2(49, 8),Vector2(49, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(70, 19),Vector2(70, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Platform(54, 17, length: 14, fallable: false)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<5;i++)
  Emitter(6 + i*10, 1, abnormalStatus: AbnormalStatus.normal, direction: ProjectileDirection.bottom, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Ride(2, 14, status: BitmanRide.sattellite),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 31)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(54, 16, w: 14, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-31', direction: SentenceDirection.horizontal)
 ])
 );

     //stage32
 final stage32 = StageComponents(
  32,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-33',answer: ['3'],maxLength: 2,problem: [
    BlackBoard(53, 6, 13, 5, status:  FrameStatus.medium),
    Sentence(55, 8, str: '51/17 = ', direction: SentenceDirection.horizontal),
    InputField(63, 8),
    InputBlock(56, 13, inputText: '3'),
    InputBlock(59, 13, inputText: '4'),
    InputBlock(62, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70,j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  FloatingBlock(1, 14, status: FloatingBlockStatus.pentagon,initialAngle: pi),
  FloatingBlock(11, 14, status: FloatingBlockStatus.pentagon,initialAngle: pi,rotateAngle: pi/6),
  FloatingBlock(21, 14, status: FloatingBlockStatus.pentagon,initialAngle: pi,rotateAngle: -pi/6),
  FloatingBlock(31, 14, status: FloatingBlockStatus.pentagon,initialAngle: pi,rotateAngle: pi/6),
  FloatingBlock(41, 14, status: FloatingBlockStatus.pentagon,initialAngle: pi,
  path: Path()..lineTo(5*16, -3*16)),
  Mass(52, 4, w:1,h:13,status: MassBlockStatus.xBlock),
  Breakables(52, -1, w: 1, h: 5, status: BreakableBlockStatus.hard),
  Platform(0, 8, length: 45, fallable: false),
  Platform(3, 4, length: 49, fallable: false),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<5;i++)
  Skelton(11 + i*8, 3, status: SkeltonStatus.horn, interval: 5),
  for(double i=0;i<5;i++)
  Skelton(4 + i*8, 7, status: SkeltonStatus.horn, interval: 4)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(8, 3, status: BitmanWeapon.pick),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 32)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(53, 16, w: 17, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-32', direction: SentenceDirection.horizontal)
 ])
 );

      //stage33
 final stage33 = StageComponents(
  33,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-33',answer: ['15'],maxLength: 2,problem: [
    BlackBoard(53, 4, 14, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '42/14*5 = ', direction: SentenceDirection.horizontal),
    InputField(64, 6),
    InputBlock(56, 13, inputText: '1'),
    InputBlock(59, 13, inputText: '4'),
    InputBlock(62, 13, inputText: '5'),
    InputBlock(65, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70,j),
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(0, 2, rank: 5, amount: 34, status: MassBlockStatus.normal,
  eraces: [
    for(double j=0;j<4;j++)
    Vector2(3, 2+ 3*j)
  ],
  adds: [
     for(double j=0;j<4;j++)
    Vector2(6, 3+ 3*j),
     for(double j=0;j<5;j++)
    Vector2(33, 3*j),
    Vector2(26, 6),
    Vector2(19, 9),
    Vector2(22, 12),
    Vector2(17, 15),
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(31+i, 2, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(12+i, 5, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(28+i, 5, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(8+i, 8, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(24+i, 8, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(20+i, 11, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(28+i, 11, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(10+i, 14, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(18+i, 14, status: PlatformStatus.fallable),
  ]),
  Platform(18, 17, length: 16, fallable: false),
  FloatingBlock(34, 14, status: FloatingBlockStatus.octagon,
  path: Path()..lineTo(12*16, 0),pathDuration: 6,
  rotateAngle: 2*pi,rotateDuration: 6),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19),
  ])
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  Dangers(27, 7, status: DangerObjectStatus.needle, length: 6, direction: DangerObjectDirection.bottom),
  Dangers(7, 10, status: DangerObjectStatus.needle, length: 12, direction: DangerObjectDirection.bottom),
  Dangers(23, 13, status: DangerObjectStatus.needle, length: 10, direction: DangerObjectDirection.bottom)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 33)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(52, 16, w: 18, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-33', direction: SentenceDirection.horizontal)
 ])
 );

      //stage34
 final stage34 = StageComponents(
  34,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-34',answer: ['12'],maxLength: 2,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '12*', direction: SentenceDirection.horizontal),
    InputField(57, 6),
    Sentence(60, 6, str: '= 144', direction: SentenceDirection.horizontal),
    InputBlock(56, 13, inputText: '3'),
    InputBlock(59, 13, inputText: '2'),
    InputBlock(62, 13, inputText: '1'),
    InputBlock(65, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70,j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19),
  ]),
  Mass(8, 14, w: 3, h: 3, status: MassBlockStatus.xBlock),
  Mass(48, 0, w: 3, h: 6, status: MassBlockStatus.xBlock),
  Mass(48, 9, w: 3, h: 8, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  // for(double i=0;i<4;i++)
  // Skelton(17 + 7*i, 2, status: SkeltonStatus.propeller, interval: 4),
  Dangers(11, 16, status: DangerObjectStatus.fire, length: 37, direction: DangerObjectDirection.bottom)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Ride(9 ,12, status: BitmanRide.sattellite),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 34)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(51, 16, w: 19, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-34', direction: SentenceDirection.horizontal)
 ])
 );

      //stage35
 final stage35 = StageComponents(
  35,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-35',answer: ['3'],maxLength: 1,problem: [
    BlackBoard(53, 4, 13, 5, status:  FrameStatus.medium),
    Sentence(55, 6, str: '39/', direction: SentenceDirection.horizontal),
    InputField(58, 6),
    Sentence(60, 6, str: '= 13', direction: SentenceDirection.horizontal),
    InputBlock(56, 13, inputText: '3'),
    InputBlock(59, 13, inputText: '2'),
    InputBlock(62, 13, inputText: 'u'),
    for(double j=0;j<17;j++)
    LockedBlock(70,j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19),
  ]),
  for(double i=0;i<4;i++)
  Platform(12 + 9*i, 3, length: 3, fallable: false),
   Platform(7, 17, length: 3, fallable: false)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  Skelton(13 + 9*i, 2, status: SkeltonStatus.bug, interval: 3)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Ride(2 ,16, status: BitmanRide.sattellite),
  HelmetItem(7, 16, status: BitmanHelmet.helmet),
  WeaponItem(9, 16, status: BitmanWeapon.shovel),
  HealItem(52, 16, status: HealItemStatus.meat),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 35)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(51, 16, w: 19, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-35', direction: SentenceDirection.horizontal)
 ])
 );

      //stage36
 final stage36 = StageComponents(
  36,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-36',answer: ['10'],maxLength: 2,problem: [
    BlackBoard(53, 4, 15, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '33/11*', direction: SentenceDirection.horizontal),
    InputField(60, 6),
    Sentence(63, 6, str: '= 30', direction: SentenceDirection.horizontal),
    InputBlock(56, 13, inputText: '3'),
    InputBlock(59, 13, inputText: '0'),
    InputBlock(62, 13, inputText: '1'),
    InputBlock(65, 13, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(70,2+j),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 18),Vector2(48, 18),Vector2(48, 19),
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(49, 19),Vector2(49, 6),Vector2(51, 6),Vector2(51, 19),
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19),
  ]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 1),Vector2(74, 1),Vector2(74, 0),
  ]),
  ReferencePoint(0, 0),
  TeleportableBlock(14, 16, targetPoints: [
    for(double i=0;i<5;i++)
    Vector2(16 + 2*i, 14- 2*i),
    Vector2(14, 16)
  ], color: Colors.pink),
  TeleportableBlock(29, 6, targetPoints: [
    Vector2(37, 6),Vector2(45, 6),Vector2(29, 6)
  ], color: Colors.orange,count: 6)
  
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  Skelton(25 + 6*i, 17, status: SkeltonStatus.horn, interval: 4),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 36)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 17, w: 49, status:DecorationStatus.deadTree, prob:0.1),
  RandomDecoration(52, 16, w: 18, status:DecorationStatus.deadTree, prob:0.1),
  Sentence(2, 3, str: '2-36', direction: SentenceDirection.horizontal)
 ])
 );

      //stage37
 final stage37 = StageComponents(
  37,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-37',answer: ['96'],maxLength: 2,problem: [
    BlackBoard(42, 3, 13, 5, status:  FrameStatus.medium),
    Sentence(43, 5, str: '12→24→48→', direction: SentenceDirection.horizontal),
    InputField(52, 5),
    InputBlock(44, 12, inputText: '3'),
    InputBlock(47, 12, inputText: '9'),
    InputBlock(50, 12, inputText: '6'),
    InputBlock(53, 12, inputText: 'u'),
    for(double i=0;i<3;i++)
    SpawnBlock(63 + i,12),
  ]),
 ]),
 platforms: PlatformLayer([
  for(double i=0;i<5;i++)
  FloatingBlock(8*i, 15, status: FloatingBlockStatus.rrect),
  for(double i=0;i<5;i++)
  FloatingBlock(4+ 8*i, 11, status: FloatingBlockStatus.rrect),
  for(double i=0;i<5;i++)
  FloatingBlock(8*i, 0, status: FloatingBlockStatus.rrect),
  for(double i=0;i<4;i++)
  FloatingBlock(4+ 8*i, 4, status: FloatingBlockStatus.rrect),
  Platform(38, 16, length: 22, fallable: false),
  Platform(39, 5, length: 3, fallable: false),
  Platform(55, 5, length: 3, fallable: false),
  Platform(39, 19, length: 3, fallable: false),
  Platform(55, 19, length: 3, fallable: false),
  Platform(70, 9, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  ReferencePoint(0, 0),
  TeleportableEnemy(40, 4, status: TeleportableEnemyStatus.miniWitch, interval: 2,
  targetPoints: [Vector2(40, 4),Vector2(56, 4),Vector2(40, 18),Vector2(56, 18)]),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(44 + i*3, 15, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  Dangers(9 + 8*i, 14, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  Dangers(9 + 8*i, 5, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.top)
  
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(71, 8, stageIndex: 37)
 ]),
 decorations: DecorationLayer([
  Sentence(3, 9, str: '2-37', direction: SentenceDirection.horizontal)
 ])
 );

      //stage38
 final stage38 = StageComponents(
  38,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-38',answer: ['4'],maxLength: 1,problem: [
    BlackBoard(33, 10, 14, 5, status:  FrameStatus.medium),
    Sentence(34, 12, str: '256→64→16→', direction: SentenceDirection.horizontal),
    InputField(44, 12),
    InputBlock(35, 5, inputText: '6'),
    InputBlock(39, 5, inputText: '4'),
    InputBlock(43, 5, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(49, 8),Vector2.all(4)
    ]),
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 8),Vector2(29, 8),Vector2(29, 0)
  ]),
  for(double i=0;i<5;i++)
  FloatingBlock(6*i, 14, status: FloatingBlockStatus.octagon),
  FloatingBlock(20, 9, status: FloatingBlockStatus.trapezoid,initialAngle: pi,
  path: Path()..lineTo(-15*16, 0),pathDuration: 10),
  Platform(30, 12, length: 3, fallable: false),
  Platform(34, 8, length: 3, fallable: false),
  Platform(38, 8, length: 3, fallable: false),
  Platform(42, 8, length: 3, fallable: false),
  Platform(72, 4, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(35 + i*4, 7, status: SimpleMoveEnemyStatus.slime, interval: 2),
  Dangers(19, 9, status: DangerObjectStatus.needle, length: 2, direction: DangerObjectDirection.right,
  path: Path()..lineTo(-15*16, 0),pathDuration: 10 ),
  Dangers(30, 9, status: DangerObjectStatus.needle, length: 2, direction: DangerObjectDirection.left,
  path: Path()..lineTo(-15*16, 0),pathDuration: 10,),
  Dangers(22, 13, status: DangerObjectStatus.needle, length: 6, direction: DangerObjectDirection.top,
  path: Path()..lineTo(-15*16, 0),pathDuration: 10),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Ride(50, 9, status: BitmanRide.sattellite),
  EndPosition(75, 0),
  GoalBlock(73, 3, stageIndex: 38)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 3, str: '2-38', direction: SentenceDirection.horizontal)
 ])
 );

      //stage39
 final stage39 = StageComponents(
  39,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(15, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(35, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(62, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '2-39',answer: ['12'],maxLength: 2,problem: [
    BlackBoard(53, 4, 14, 5, status:  FrameStatus.medium),
    Sentence(54, 6, str: '4→', direction: SentenceDirection.horizontal),
    InputField(56, 6),
    Sentence(58, 6, str: '→36→108', direction: SentenceDirection.horizontal),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: '4'),
    InputBlock(62, 13, inputText: '1'),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [Vector2(70, 2),Vector2.all(15)])
  ]),
 ]),
 platforms: PlatformLayer([
  for(double i=0;i<3;i++)
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(20*i, 0),Vector2(20*i, 9),Vector2(20*i+9, 9),Vector2(20*i+9, 0)
  ]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(50, 0),Vector2(50, 1),Vector2(74, 1),Vector2(74, 0)
  ]),
   Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(50, 19),Vector2(50, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  for(double i=0;i<3;i++)
  FloatingBlock(i*20, 16, status: FloatingBlockStatus.trapezoid),
  FloatingBlock(10, 3, status: FloatingBlockStatus.rectangle,customSize: Vector2.all(10),
  path: Path()..lineTo(0, 16*7),pathDuration: 3),
  FloatingBlock(30, 3, status: FloatingBlockStatus.rectangle,customSize: Vector2.all(10),
  path: Path()..lineTo(0, 16*7))
  
 ]),
 enemies: EnemyLayer([
  Dangers(10, 13, status: DangerObjectStatus.needle, length: 10, direction:DangerObjectDirection.top,
   path: Path()..lineTo(0, 16*7),pathDuration: 3),
  Dangers(30, 13, status: DangerObjectStatus.needle, length: 10, direction:DangerObjectDirection.top,
   path: Path()..lineTo(0, 16*7)),
   Skelton(22, 15, status: SkeltonStatus.normal, interval: 3),
   Skelton(42, 15, status: SkeltonStatus.horn, interval: 3),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(50, 16, status: HealItemStatus.pear),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 39)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 3, str: '2-39', direction: SentenceDirection.horizontal)
 ])
 );

      //stage40
 final stage40 = StageComponents(
  40,
 background:BackgroundLayer(status: BackgroundStatus.industry),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(19, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(41, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '2-40-1',answer: ['25'],maxLength: 2,problem: [
    BlackBoard(34, 4, 15, 5, status:  FrameStatus.soft),
    Sentence(35, 6, str: '625→125→', direction: SentenceDirection.horizontal),
    InputField(43, 6),
    Sentence(45, 6, str: '→5', direction: SentenceDirection.horizontal),
    InputBlock(35, 10, inputText: '5'),
    InputBlock(38, 10, inputText: '2'),
    InputBlock(41, 10, inputText: '3'),
    InputBlock(44, 10, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(52, 2+j),
    for(double j=0;j<3;j++)
    LockedBlock(48, 14+j),
    for(double i=0;i<4;i++)
    LockedBlock(48+i, 13)
  ]),
    Problem(id: '2-40-2',answer: ['42'],maxLength: 2,problem: [
    BlackBoard(54, 3, 15, 6, status:  FrameStatus.soft),
    Sentence(56, 4, str: '21*X = 63', direction: SentenceDirection.horizontal),
    Sentence(57, 5, str: 'Y/X = 14', direction: SentenceDirection.horizontal),
    Sentence(59, 7, str: 'Y = ', direction: SentenceDirection.horizontal),
    InputField(63, 7),
    InputBlock(55, 12, inputText: '2'),
    InputBlock(58, 12, inputText: '4'),
    InputBlock(61, 12, inputText: '3'),
    InputBlock(64, 12, inputText: 'u'),
    for(double j=0;j<15;j++)
    LockedBlock(70, 2+j),
    for(double j=0;j<3;j++)
    LockedBlock(66, 14+j),
    for(double i=0;i<4;i++)
    LockedBlock(66+i, 13)
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 1),Vector2(74, 1),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(3, 17),Vector2(3, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(25, 19),Vector2(25, 17),Vector2(29, 17),Vector2(29, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(48, 19),Vector2(48, 17),Vector2(52, 17),Vector2(52, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(66, 19),Vector2(66, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Platform(9, 7, length: 3, fallable: false),
  Platform(24, 7, length: 3, fallable: false),
  Platform(49, 7, length: 3, fallable: false),
  Platform(71, 7, length: 3, fallable: false),
  Platform(22, 17, length: 3, fallable: false),
  Platform(37, 17, length: 3, fallable: false),
  Mass(4, 19, w: 21, h: 1, status: MassBlockStatus.xBlock),
  Mass(30, 19, w: 18, h: 1, status: MassBlockStatus.xBlock),
  Mass(53, 19, w: 13, h: 1, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  Dangers(4, 18, status: DangerObjectStatus.fire, length: 21, direction: DangerObjectDirection.bottom),
  Dangers(30, 18, status: DangerObjectStatus.fire, length: 18, direction: DangerObjectDirection.bottom),
  Dangers(53, 18, status: DangerObjectStatus.fire, length: 13, direction: DangerObjectDirection.bottom),
  ReferencePoint(0, 0),
  TeleportableEnemy(10, 6, status:TeleportableEnemyStatus.miniWitch, interval: 2,
  targetPoints: [Vector2(10, 6),Vector2(25, 6),Vector2(23, 16)]),
  TeleportableEnemy(38, 16, status:TeleportableEnemyStatus.miniWitch, interval: 2,
  targetPoints: [Vector2(38, 16),Vector2(50, 6),Vector2(72, 6)]),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Ride(10, 15, status: BitmanRide.sattellite),
  HelmetItem(3, 16, status: BitmanHelmet.helmet),
  EndPosition(75, 0),
  HealItem(27, 16, status: HealItemStatus.apple),
  HealItem(50, 16, status: HealItemStatus.apple),
  HealItem(68, 16, status: HealItemStatus.apple),
  Entrance(73, 16, stageIndex: -2, status: EntranceBlockStatus.open)
 ]),
 decorations: DecorationLayer([
  Sentence(2, 2, str: '2-40', direction: SentenceDirection.horizontal)
 ])
 );

  //bossStage2
 final bossStage2 = StageComponents(
  -2,
 background:BackgroundLayer(status: BackgroundStatus.lava),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    for(double i=0;i<6;i++)
    Decoration(14*i, 5, status: DecorationStatus.yellowTorch)
  ]
 ),
 problems: ProblemLayer([
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 1),Vector2(74, 1),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  for(double i=0;i<3;i++)
  Platform(7 + 4*i, 14 - 4*i, length: 3, fallable: false),
  for(double i=0;i<3;i++)
  Platform(36, 14 - 4*i, length: 3, fallable: false),
  for(double i=0;i<3;i++)
  Platform(59 - 4*i, 14 - 4*i, length: 3, fallable: false),
  for(double j=0;j<15;j++)
  EnemyLockedBlock(71, 2+j),
  Platform(7, 5,length: 3,fallable: false),
  Platform(18, 5,length: 3,fallable: false),
  Platform(19, 13,length: 3,fallable: false),
  Platform(31, 5,length: 3,fallable: false),
  Platform(30, 13,length: 3,fallable: false),
  Platform(41, 5,length: 3,fallable: false),
  Platform(42, 13,length: 3,fallable: false),
  Platform(59, 5,length: 3,fallable: false),
 ]),
 enemies: EnemyLayer([
  ReferencePoint(0, 0),
  Witch(30, 11,normalTargetPoints:[Vector2(20, 11),Vector2(30, 11),Vector2(43, 11)],
  angryTargetPoints: [Vector2(20, 11),Vector2(30, 11),Vector2(43, 11),Vector2(18, 3),Vector2(32, 3),Vector2(41, 3)],crazyTargetPoints: [
    Vector2(20, 11),Vector2(30, 11),Vector2(43, 11),Vector2(18, 3),Vector2(32, 3),Vector2(41, 3),Vector2(7, 3),Vector2(60, 3)])
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  HelmetItem(3, 16, status:BitmanHelmet.helmet),
  WeaponItem(4, 16, status: BitmanWeapon.bomb),
  for(double i=0;i<3;i++)
  WeaponItem(8 + 4*i, 13 - 4*i, status: BitmanWeapon.bomb),
  for(double i=0;i<2;i++)
  WeaponItem(37, 13 - 4*i, status: BitmanWeapon.bomb),
  HealItem(37, 5, status: HealItemStatus.pear),
  for(double i=0;i<3;i++)
  WeaponItem(60 - 4*i, 13 - 4*i, status: BitmanWeapon.bomb),
  GoalBlock(73, 16, stageIndex: 40)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 18, status: DecorationStatus.deadTree, prob: 0.1),
  RandomDecoration(21, 16, w: 10, status: DecorationStatus.deadTree, prob: 0.1),
  RandomDecoration(44, 16, w: 27, status: DecorationStatus.deadTree, prob: 0.1),
 ])
 );


     //stage41
 final stage41 = StageComponents(
  41,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-41',answer: ['12'],maxLength: 2,problem: [
    BlackBoard(54, 3, 15, 9, status:  FrameStatus.hard),
    Sentence(58, 4, str: 'X = Y', direction: SentenceDirection.horizontal),
    Sentence(56, 5, str: 'X+Y = 24', direction: SentenceDirection.horizontal),
    Sentence(55, 7, str: '→X+Y = X+X', direction: SentenceDirection.horizontal),
    Sentence(60, 8, str: '= 2*X', direction: SentenceDirection.horizontal),
    Sentence(60, 9, str: '= 24', direction: SentenceDirection.horizontal),
    Sentence(55, 10, str: '→  X = ', direction: SentenceDirection.horizontal),
    InputField(62, 10),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: '4'),
    InputBlock(62, 13, inputText: '1'),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [Vector2(70, 3),Vector2.all(14)])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 2),Vector2(74, 2),Vector2(74, 0)
  ]),
   Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(19, 17),Vector2(19, 19)
  ]),
   Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(20, 19),Vector2(20, 5),Vector2(22, 5),Vector2(22, 19)
  ]),
   Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(51, 19),Vector2(51, 7),Vector2(53, 7),Vector2(53, 19)
  ]),
   Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(70, 19),Vector2(70, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  for(double i=0;i<4;i++)
  Platform(31 + 5*i, 17 - 2*i ,length: 3, fallable: false),
  Platform(54, 17 ,length: 15, fallable: false)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  SimpleMoveEnemy(21, 7, status: SimpleMoveEnemyStatus.ghost1, interval: 2),
  SimpleMoveEnemy(21, 11, status: SimpleMoveEnemyStatus.ghost1, interval: 2)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(10, 13, status: BitmanWeapon.arrow),
  Spring(19, 16),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 41)
 ]),
 decorations: DecorationLayer([
   Cords(10, 3, w: 1, h: 10, status: CordBlockStatus.thread),
  RandomDecoration(0, 16, w: 19, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(54, 16, w: 15, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(0, 16, w: 19, status: DecorationStatus.grave3, prob: 0.1),
  Sentence(2, 3, str: '3-41', direction: SentenceDirection.horizontal)
 ])
 );


    //stage42
 final stage42 = StageComponents(
  42,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-42',answer: ['2'],maxLength: 1,problem: [
    BlackBoard(54, 2, 15, 11, status:  FrameStatus.hard),
    Sentence(58, 3, str: 'X = 6-Y', direction: SentenceDirection.horizontal),
    Sentence(56, 4, str: 'X-Y = 2', direction: SentenceDirection.horizontal),
    Sentence(55, 6, str: '→(6-Y)-Y = 2', direction: SentenceDirection.horizontal),
    Sentence(55, 7, str: '→6-2*Y = 2', direction: SentenceDirection.horizontal),
    Sentence(55, 8, str: '→2*Y+2 = 6', direction: SentenceDirection.horizontal),
    Sentence(55, 9, str: '→2*Y = 6-2', direction: SentenceDirection.horizontal),
    Sentence(60, 10, str: '= 4', direction: SentenceDirection.horizontal),
    Sentence(55, 11, str: '→  Y = ', direction: SentenceDirection.horizontal),
    InputField(62, 11),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: '3'),
    InputBlock(62, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [Vector2(70, 14),Vector2.all(5)])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(45, 19),Vector2(45, 5),Vector2(47, 5),Vector2(47, 19),
  ]),
  Platform(2, 13, length: 3, fallable: false),
  Platform(55, 17, length: 12, fallable: false),
  Platform(71, 17, length: 3, fallable: false)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  Spawner(46, 4, status: SpawnerStatus.grave1)
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HelmetItem(8, 8, status:BitmanHelmet.helmet),
  WeaponItem(10, 8, status: BitmanWeapon.arrow),
  Ride(8, 13, status: BitmanRide.sattellite),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 42)
 ]),
 decorations: DecorationLayer([
  Cords(8, 0, w: 1, h: 8, status:CordBlockStatus.thread),
  Cords(10, 0, w: 1, h: 8, status: CordBlockStatus.thread),
  
  RandomDecoration(55, 16, w: 12, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 3, str: '3-42', direction: SentenceDirection.horizontal)
 ])
 );

   //stage43
 final stage43 = StageComponents(
  43,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-43',answer: ['4'],maxLength: 1,problem: [
    BlackBoard(53, 1, 15, 9, status:  FrameStatus.hard),
    Sentence(55, 2, str: 'X+Y = 6', direction: SentenceDirection.horizontal),
    Sentence(55, 3, str: 'X-Y = 2', direction: SentenceDirection.horizontal),
    Sentence(54, 5, str: '→(X+Y)-(X-Y)', direction: SentenceDirection.horizontal),
    Sentence(55, 6, str: '= 6+2', direction: SentenceDirection.horizontal),
    Sentence(54, 7, str: '→ 2*X = 8', direction: SentenceDirection.horizontal),
    Sentence(54, 8, str: '→   X = ', direction: SentenceDirection.horizontal),
    InputField(62, 8),
    InputBlock(56, 13, inputText: '4'),
    InputBlock(59, 13, inputText: '2'),
    InputBlock(62, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [Vector2(70, 0),Vector2.all(20)])
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(0, 2, rank: 6, amount: 51, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<5;j++)
    Vector2(2, j*3),
    for(double j=0;j<5;j++)
    Vector2(5, j*3),
    Vector2(25, 9),
    Vector2(25, 15),
    for(double j=0;j<3;j++)
    Vector2(37,6 + j*3),
     for(double j=0;j<5;j++)
    Vector2(42,6 + j*3),
    Vector2(50, 0),
    Vector2(50, 3),
     for(double j=0;j<4;j++)
    Vector2(50,9 + j*3),
  ],
  eraces: [
    for(double j=0;j<5;j++)
    Vector2(3,2 + j*3),
    Vector2(6, 14),
    Vector2(35, 11),
    Vector2(26, 8),
    Vector2(8, 5),
    Vector2(6, 14),
    Vector2(38, 8),
    Vector2(40, 8),
    Vector2(38, 11),
    Vector2(40, 11),
  ],
  replaces: [
    for(double i=0;i<3;i++)
    PlatformBlock(8+i, 8, status: PlatformStatus.fallable),
    for(double i=0;i<4;i++)
    PlatformBlock(38+i, 5, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(46+i, 5, status: PlatformStatus.fallable),
    for(double i=0;i<7;i++)
    PlatformBlock(43+i, 8, status: PlatformStatus.fallable),
  ]
  ),
  Platform(54, 17, length: 11, fallable: false),
  Platform(71, 17, length: 3, fallable: false)
 ]),
 enemies: EnemyLayer([
  Dangers(6, 1, status:DangerObjectStatus.needle, length: 44, direction: DangerObjectDirection.bottom),
  Dangers(38, 13, status:DangerObjectStatus.needle, length: 4, direction: DangerObjectDirection.bottom),
  Dangers(43, 10, status:DangerObjectStatus.needle, length: 7, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(34, 4, status: SimpleMoveEnemyStatus.skelton, interval: 2),
  SimpleMoveEnemy(34, 13, status: SimpleMoveEnemyStatus.skelton, interval: 2),
  Skelton(7, 10, status: SkeltonStatus.horn, interval: 3),
  Skelton(12, 10, status: SkeltonStatus.horn, interval: 3),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(25, 13, status: BitmanWeapon.arrow),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 43)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(10, 4, w: 38, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(11, 7, w: 15, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(6, 10, w: 19, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(8, 13, w: 25, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(0, 16, w: 25, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(1, 18, str: '3-43', direction: SentenceDirection.horizontal)
 ])
 );


   //stage44
 final stage44 = StageComponents(
  44,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-44',answer: ['5'],maxLength: 1,problem: [
    BlackBoard(31, 2, 15, 9, status:  FrameStatus.hard),
    Sentence(33, 3, str: '3*X+Y = 20', direction: SentenceDirection.horizontal),
    Sentence(37, 4, str: 'X = Y', direction: SentenceDirection.horizontal),
    Sentence(32, 6, str: '→3*Y+Y = 20', direction: SentenceDirection.horizontal),
    Sentence(32, 7, str: '→  4*Y = 20', direction: SentenceDirection.horizontal),
    Sentence(32, 8, str: '→    Y = ', direction: SentenceDirection.horizontal),
    InputField(41, 8),
    InputBlock(33, 15, inputText: '4'),
    InputBlock(36, 15, inputText: '5'),
    InputBlock(39, 15, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [Vector2(47, 10),Vector2.all(5)])
  ]),
 ]),
 platforms: PlatformLayer([
  Platform(2, 15, length: 3, fallable: true),
  Platform(48, 13, length: 3, fallable: true),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(30, 19),Vector2(30, 19),Vector2(74, 19),Vector2(74, 19),
  ]),
  ReferencePoint(0, 0),
  TeleportableBlock(8, 14, targetPoints: [
    for(double i=0;i<3;i++)
    Vector2(12 + i*5, 14),
    Vector2(8, 14)
  ], color: Colors.purple)
 ]),
 enemies: EnemyLayer([
  Spawner(71, 18, status:SpawnerStatus.bugPot),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(33 + i*3, 18, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(49, 12, status: BitmanWeapon.arrow),
  EndPosition(75, 0),
  GoalBlock(72, 18, stageIndex: 44)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(30, 18, w: 38, status: DecorationStatus.purpleGrass, prob: 0.1),
  
  Sentence(2, 3, str: '3-44', direction: SentenceDirection.horizontal)
 ])
 );

  //stage45
 final stage45 = StageComponents(
  45,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-45',answer: ['20'],maxLength: 2,problem: [
    BlackBoard(52, 2, 15, 11, status:  FrameStatus.hard),
    Sentence(56, 3, str: 'X/2 = 30-Y', direction: SentenceDirection.horizontal),
    Sentence(58, 4, str: 'X = Y', direction: SentenceDirection.horizontal),
    Sentence(53, 6, str: '→  X/2 = 30-X', direction: SentenceDirection.horizontal),
    Sentence(53, 7, str: '→X = 2*(30-X)', direction: SentenceDirection.horizontal),
    Sentence(56, 8, str: '= 60-2*X', direction: SentenceDirection.horizontal),
    Sentence(53, 9, str: '→X+2*X', direction: SentenceDirection.horizontal),
    Sentence(53, 10, str: '= 3*X = 60', direction: SentenceDirection.horizontal),
    Sentence(53, 11, str: '→  X = ', direction: SentenceDirection.horizontal),
    InputField(60, 11),
    InputBlock(56, 13, inputText: '4'),
    InputBlock(59, 13, inputText: '0'),
    InputBlock(62, 13, inputText: '2'),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [Vector2(70, 0),Vector2.all(17)])
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(0, 0, rank: 7, amount: 49, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<3;j++)
    Vector2(10, 10+j*3),
    Vector2(17, 4),
    Vector2(21, 7),
    Vector2(20, 13),
    Vector2(23, 16),
    Vector2(37, 1),
    Vector2(37, 10),
    Vector2(37, 13),
    for(double j=0;j<5;j++)
    Vector2(48, 1+j*3),
  ],
  eraces: [
    Vector2(3, 3),Vector2(3, 6),Vector2(7, 9),Vector2(3, 12),Vector2(3, 15),Vector2(21, 15),
    Vector2(38, 12),Vector2(40, 12),Vector2(42, 12),Vector2(44, 12),Vector2(46, 12),
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(18+i, 3, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(41+i, 6, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(22+i, 9, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(35+i, 15, status: PlatformStatus.fallable),
    for(double i=0;i<9;i++)
    for(double j=0;j<3;j++)
    PlatformBlock(11+i, 12 + j*3, status: PlatformStatus.fallable),
    for(double i=0;i<10;i++)
    PlatformBlock(38+i, 9, status: PlatformStatus.fallable),
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19)
  ])
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(39 + i*3, 14, status: SimpleMoveEnemyStatus.aligator, interval: 2),
  for(double j=0;j<3;j++)
  Dangers(0, 2 + 3*j, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(36, 2, status: SimpleMoveEnemyStatus.skelton, interval: 2),
  SimpleMoveEnemy(22, 17, status: SimpleMoveEnemyStatus.skelton, interval: 1),
  SimpleMoveEnemy(20, 17, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(34, 11, status: HealItemStatus.pear),
  WeaponItem(8, 11, status: BitmanWeapon.arrow),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 45)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(25, 17, w: 24, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(20, 11, w: 17, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(9, 8, w: 12, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(18, 5, w: 23, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(5, 2, w: 13, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 2, str: '3-45', direction: SentenceDirection.horizontal)
 ])
 );


 //stage46
 final stage46 = StageComponents(
  46,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-46',answer: ['3'],maxLength: 1,problem: [
    BlackBoard(36, 2, 15, 11, status:  FrameStatus.hard),
    Sentence(43, 3, str: 'Y = X/3', direction: SentenceDirection.horizontal),
    Sentence(37, 4, str: '2*X+6*Y = 12', direction: SentenceDirection.horizontal),
    Sentence(37, 6, str: '→2*X+6*(X/3)', direction: SentenceDirection.horizontal),
    Sentence(38, 7, str: '= 12', direction: SentenceDirection.horizontal),
    Sentence(37, 8, str: '→2*X + 2*X', direction: SentenceDirection.horizontal),
    Sentence(38, 9, str: '= 4*X = 12', direction: SentenceDirection.horizontal),
    Sentence(37, 10, str: '→    X =', direction: SentenceDirection.horizontal),
    InputField(46, 10),
    InputBlock(39, 14, inputText: '4'),
    InputBlock(42, 14, inputText: '3'),
    InputBlock(45, 14, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [Vector2(53, 14),Vector2.all(3)],
    eraces: [Vector2(54, 16)])
  ]),
 ]),
 platforms: PlatformLayer([
  ReferencePoint(0, 0),
  Platform(1, 2, length: 3, fallable: false),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(19, 17),Vector2(19, 19)
  ]),
  TeleportableBlock(3, 15, targetPoints: [
    Vector2(5, 15),Vector2(7, 15),Vector2(3, 15)
  ], color: Colors.pink,count: 4),
  TeleportableBlock(10, 12, targetPoints: [
    Vector2(10, 9),Vector2(10, 6),Vector2(13, 6),Vector2(16, 6),Vector2(19, 6),Vector2(10, 12)
  ], color: Colors.blueGrey,count: 2),
  TeleportableBlock(28, 11, targetPoints: [
    Vector2(28, 15),Vector2(28, 19),Vector2(32, 19),Vector2(28, 11)
  ], color: Colors.yellow,count: 3),
  Grnd(status: GrndStatus.invertedRect, gridPoints:[
    Vector2(31, 0),Vector2(31, 16),Vector2(33, 16),Vector2(33, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(36, 19),Vector2(36, 17),Vector2(55, 17),Vector2(55, 19)
  ]),

  Platform(71, 9, length: 3, fallable: false),
 ]),
 enemies: EnemyLayer([
  Dangers(0, 16, status: DangerObjectStatus.needle, length: 20, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(2, 1, status: SimpleMoveEnemyStatus.skelton, interval: 1),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(39 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(58 + i*4, 9, status: SimpleMoveEnemyStatus.bat, interval: 2+Random().nextInt((i+1).toInt())),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Spring(54, 16),
  EndPosition(75, 0),
  GoalBlock(72, 8, stageIndex: 46)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(36, 16, w: 17, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 3, str: '3-46', direction: SentenceDirection.horizontal)
 ])
 );

//stage47
 final stage47 = StageComponents(
  47,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    
    Problem(id: '3-47',answer: ['12'],maxLength: 2,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.hard),
    Sentence(56, 7, str: 'X+Y = 25', direction: SentenceDirection.horizontal),
    Sentence(58, 8, str: 'Y = X+1', direction: SentenceDirection.horizontal),
    Sentence(56, 9, str: '→ X = ', direction: SentenceDirection.horizontal),
    InputField(62, 9),
    InputBlock(56, 13, inputText: '2'),
    InputBlock(59, 13, inputText: '1'),
    InputBlock(62, 13, inputText: '7'),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [Vector2(70, 0),Vector2.all(17)])
  ]),
 ]),
 platforms: PlatformLayer([

  Platform(13, 14, length: 3, fallable: false,
  path: Path()..quadraticBezierTo(14*16, -3*16, 20*16, -10*16),pathDuration: 30),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(0, 19),Vector2(0, 17),Vector2(13, 17),Vector2(13, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(38, 19),Vector2(38, 12),Vector2(40, 12),Vector2(40, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(41, 19),Vector2(41, 9),Vector2(43, 9),Vector2(43, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(44, 19),Vector2(44, 6),Vector2(46, 6),Vector2(46, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(47, 19),Vector2(47, 3),Vector2(49, 3),Vector2(49, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(50, 19),Vector2(50, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
 ]),
 enemies: EnemyLayer([
  Spawner(48, 2, status: SpawnerStatus.grave2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(3, 16, status: BitmanWeapon.arrow),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 47)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 14, status: DecorationStatus.purpleGrass, prob: 0.1),
  RandomDecoration(50, 16, w: 20, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 3, str: '3-47', direction: SentenceDirection.horizontal)
 ])
 );

//stage48
 final stage48 = StageComponents(
  48,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-48',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(34, 11, 13, 5, status:  FrameStatus.hard),
    Sentence(38, 12, str: 'X = Y', direction: SentenceDirection.horizontal),
    Sentence(36, 13, str: '3*X = 24-Y', direction: SentenceDirection.horizontal),
    Sentence(36, 14, str: '→ X = ', direction: SentenceDirection.horizontal),
    InputField(42, 14),
    InputBlock(39, 4, inputText: '6'),
    InputBlock(42, 4, inputText: '7'),
    InputBlock(45, 4, inputText: 'u'),
    for(double i=0;i<6;i++)
    Spawns(status: SpawnsStatus.horizontal, gridPoints: [
      Vector2(47 + 4*i, 8),Vector2.all(3)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Platform(2, 17, length: 3, fallable: false),
  Platform(34, 8, length: 13, fallable: false),
  Platform(23, 19, length: 3, fallable: false),
  Platform(70, 7, length: 3, fallable: false)
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<8;i++)
  SimpleMoveEnemy(9 + 3*i, 16 - 1.5*i, status: SimpleMoveEnemyStatus.bat, interval: 0,
  path: Path()..addArc(Rect.fromCenter(center: const Offset(-1*16, 0), width: 2*16, height: 2*16), 0, 2*pi),pathAlternate: false,pathDuration: 6),
  SimpleMoveEnemy(24, 18, status: SimpleMoveEnemyStatus.skelton, interval: 0),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(39 + i*3, 7, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(35, 7, status: HealItemStatus.meat),
  EndPosition(75, 0),
  GoalBlock(71, 6, stageIndex: 48)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(34, 7, w: 13, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 3, str: '3-48', direction: SentenceDirection.horizontal)
 ])
 );

//stage49
 final stage49 = StageComponents(
  49,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-49',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.hard),
    Sentence(56, 7, str: 'X = 2*Y', direction: SentenceDirection.horizontal),
    Sentence(56, 8, str: '2*X = 30-Y', direction: SentenceDirection.horizontal),
    Sentence(55, 9, str: '→  X = ', direction: SentenceDirection.horizontal),
    InputField(62, 9),
    InputBlock(56, 13, inputText: '4'),
    InputBlock(59, 13, inputText: '6'),
    InputBlock(62, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 0),Vector2.all(17)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status:GrndStatus.invertedRect, gridPoints: [
    Vector2(7, 0),Vector2(7, 13),Vector2(47, 13),Vector2(47, 0)
  ]),
  Grnd(status:GrndStatus.rectangle, gridPoints: [
    Vector2(50, 19),Vector2(50, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  for(double i=0;i<5;i++)
  FloatingBlock(10*i, 16, status: FloatingBlockStatus.trapezoid),
 ]),
 enemies: EnemyLayer([
  Dangers(7, 14, status: DangerObjectStatus.needle, length: 41, direction: DangerObjectDirection.top),
  Spawner(47, 15, status: SpawnerStatus.bugPot,direction: ProjectileDirection.left),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(52, 16, status: HealItemStatus.apple),
  WeaponItem(4, 15, status: BitmanWeapon.arrow),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 49)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(50, 16, w: 20, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 3, str: '3-49', direction: SentenceDirection.horizontal)
 ])
 );

//stage50
 final stage50 = StageComponents(
  50,
 background:BackgroundLayer(status: BackgroundStatus.moon),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-50',answer: ['6'],maxLength: 1,problem: [
    BlackBoard(35, 0, 15, 11, status:  FrameStatus.hard),
    Sentence(37, 1, str: "X+Y = 5", direction: SentenceDirection.horizontal),
    Sentence(37, 2, str: "3*X-2*Y = 20", direction: SentenceDirection.horizontal),
    Sentence(36, 4, str: "→2*X+2*Y = 10", direction: SentenceDirection.horizontal),
    Sentence(37, 5, str: "3*X-2*Y = 20", direction: SentenceDirection.horizontal),
    Sentence(36, 6, str: "→2*X+3*X = 30", direction: SentenceDirection.horizontal),
    Sentence(36, 7, str: "→    5*X = 30", direction: SentenceDirection.horizontal),
    Sentence(36, 8, str: "→      X = ", direction: SentenceDirection.horizontal),
    Sentence(43, 9, str: "Y = -1", direction: SentenceDirection.horizontal),
    InputField(47, 8),
    InputBlock(38, 13, inputText: '4'),
    InputBlock(42, 13, inputText: '6'),
    InputBlock(46, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(50, 10),Vector2.all(2)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(0, 0, rank: 7, amount: 35, status: MassBlockStatus.normal,
  adds: [
    Vector2(23, 7),Vector2(29, 10),Vector2(34, 1),Vector2(34, 4),Vector2(34, 7),Vector2(34, 13),Vector2(34, 16),
    Vector2(5, 13),Vector2(9, 10),Vector2(9, 7),Vector2(13, 16),Vector2(16, 10),Vector2(16, 13),Vector2(20, 4)
  ],
  eraces: [
    Vector2(3, 12),Vector2(6, 9),Vector2(7, 6),Vector2(4, 3),Vector2(24, 9),Vector2(20, 12),Vector2(20, 15),
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(10+i, 12, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(14+i, 9, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(14+i, 15, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(21+i, 6, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(24+i, 3, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(31+i, 9, status: PlatformStatus.fallable),
  ]),
  Maze(50, 0, rank: 7, amount: 24, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<3;j++)
    Vector2(50, 1+j*3),
    for(double j=0;j<3;j++)
    Vector2(50, 13+j*3),
    for(double j=0;j<6;j++)
    Vector2(56, 4+j*3),
    for(double j=0;j<3;j++)
    Vector2(59, 1+j*3),
    Vector2(59, 16),
    for(double j=0;j<7;j++)
    Vector2(73, 1+j*3),
  ],
  eraces: [
    Vector2(54, 3),Vector2(53, 6),Vector2(52, 9),
    for(double j=0;j<6;j++)
    Vector2(57, 3 + j*3)
    ],
  replaces: []),
  Breakables(59, 13, w: 1, h: 2, status:BreakableBlockStatus.hard),
  Platform(35, 17, length: 15, fallable: false)
 ]),
 enemies: EnemyLayer([
  
  for(double j=0;j<6;j++)
  SimpleMoveEnemy(27, 2 + 3*j, status: SimpleMoveEnemyStatus.ghost1, interval: 2),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(38 + i*4, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<2;i++)
  for(double j=0;j<6;j++)
  SimpleMoveEnemy(62 + i*8, 2+ 3*j, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(17, 11, status: HealItemStatus.pear),
  HealItem(17, 14, status: HealItemStatus.pear),
  WeaponItem(7, 11, status: BitmanWeapon.arrow),
  WeaponItem(66, 11, status: BitmanWeapon.pick),
  EndPosition(75, 0),
  GoalBlock(71, 14, stageIndex: 50)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(35, 16, w: 15, status: DecorationStatus.purpleGrass, prob: 0.1),
  Sentence(2, 4, str: '3-50', direction: SentenceDirection.horizontal)
 ])
 );

//stage51
 final stage51 = StageComponents(
  51,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-51',answer: ['<'],maxLength: 1,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.hard),
    Sentence(56, 8, str: "10   5+6", direction: SentenceDirection.horizontal),
    InputField(59, 8),
    InputBlock(56, 13, inputText: '<'),
    InputBlock(59, 13, inputText: '>'),
    InputBlock(62, 13, inputText: '='),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 0),Vector2.all(17)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 9),Vector2(52, 9),Vector2(52, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(52, 17),Vector2(52, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(70, 19),Vector2(70, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Platform(55, 17, length: 12, fallable: false),
  for(double i=0;i<5;i++)
  Mass(10 + 10*i, 15, w: 3, h: 2, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<5;i++)
  Dangers(9 + i*10, 15, status: DangerObjectStatus.needle, length: 2, direction: DangerObjectDirection.right),
  for(double i=0;i<5;i++)
  Dangers(13 + i*10, 15, status: DangerObjectStatus.needle, length: 2, direction: DangerObjectDirection.left),
  for(double i=0;i<5;i++)
  Dangers(10 + i*10, 14, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(16 + i*10, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 51)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 53, status: DecorationStatus.seedLeaf, prob: 0.1),
  Sentence(2, 4, str: '3-51', direction: SentenceDirection.horizontal)
 ])
 );

 

 //stage52
 final stage52 = StageComponents(
  52,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-52',answer: ['>'],maxLength: 1,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.hard),
    Sentence(55, 8, str: "30-13   16", direction: SentenceDirection.horizontal),
    InputField(61, 8),
    InputBlock(56, 13, inputText: '<'),
    InputBlock(59, 13, inputText: '>'),
    InputBlock(62, 13, inputText: '='),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 0),Vector2.all(17)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(0, 0, rank: 7, amount: 52, status:MassBlockStatus.normal,
  adds: [
    for(double j=0;j<5;j++)
    Vector2(25, 1+3*j),
    for(double j=0;j<4;j++)
    Vector2(34, 7+3*j),
    for(double j=0;j<5;j++)
    Vector2(47, 4+3*j),
    for(double j=0;j<6;j++)
    Vector2(51, 4+3*j),
    Vector2(9, 13),
    Vector2(12, 16),
    Vector2(39, 4)
  ],
  eraces: [
    Vector2(3, 12),Vector2(10, 15),Vector2(31, 6),Vector2(26, 9),
    Vector2(31, 12),Vector2(31, 15),Vector2(41, 6),Vector2(45, 3)
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(13+i, 12, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(19+i, 15, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(36+i, 6, status: PlatformStatus.fallable),
    for(double i=0;i<21;i++)
    BreakableBlock(13+i, 18, status: BreakableBlockStatus.projectileBreakable),
  ]),
  Breakables(9, 10, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(15, 13, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(21, 16, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(28, 7, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(28, 10, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(39, 7, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(47, 1, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(52, 19),Vector2(52, 17),Vector2(74, 17),Vector2(74, 19)
  ])
 ]),
 enemies: EnemyLayer([
  for(double j=0;j<3;j++)
  SimpleMoveEnemy(24, 2+ j*3, status: SimpleMoveEnemyStatus.skelton, interval: 0),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HelmetItem(5, 11, status: BitmanHelmet.armor),
  WeaponItem(6, 11, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 52)
 ]),
 decorations: DecorationLayer([
  Decoration(2, 10, status: DecorationStatus.tSignboard),
  RandomDecoration(52, 16, w: 18, status: DecorationStatus.seedLeaf, prob: 0.1),
  Sentence(2, 4, str: '3-52', direction: SentenceDirection.horizontal)
 ])
 );

 
 //stage53
 final stage53 = StageComponents(
  53,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-53',answer: ['<'],maxLength: 1,problem: [
    BlackBoard(54, 6, 16, 5, status:  FrameStatus.hard),
    Sentence(55, 8, str: "30-14   11+10", direction: SentenceDirection.horizontal),
    InputField(61, 8),
    InputBlock(56, 13, inputText: '<'),
    InputBlock(59, 13, inputText: '>'),
    InputBlock(62, 13, inputText: '='),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 4),Vector2.all(13)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 3),Vector2(74, 3),Vector2(74, 0)
  ]),
  Breakables(17, 4, w: 2, h: 13, status: BreakableBlockStatus.stalk),
  Breakables(49, 4, w: 2, h: 13, status: BreakableBlockStatus.stalk),
  Platform(19 , 6, length: 3, fallable: false,
  path: Path()..lineTo(27*16, 0),pathDuration: 10),
  Mass(22, 13, w: 6, h: 4, status: MassBlockStatus.xBlock),
  Mass(31, 11, w: 6, h: 6, status: MassBlockStatus.xBlock),
  Mass(40, 9, w: 6, h: 8, status: MassBlockStatus.xBlock),
 ]),
 enemies: EnemyLayer([
  Dangers(7, 4, status: DangerObjectStatus.icicle, length: 4, direction: DangerObjectDirection.bottom),
  Spawner(20 , 5, status:SpawnerStatus.grave1,path: Path()..lineTo(27*16, 0),pathDuration: 10),
  for(double i=0;i<2;i++)
  Dangers(28 + 9*i, 16, status: DangerObjectStatus.needle, length: 3, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HelmetItem(12, 16, status: BitmanHelmet.armor),
  WeaponItem(14, 16, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 53)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(0, 16, w: 22, status: DecorationStatus.seedLeaf, prob: 0.1),
  RandomDecoration(46, 16, w: 24, status: DecorationStatus.seedLeaf, prob: 0.1),
  Sentence(2, 5, str: '3-53', direction: SentenceDirection.horizontal)
 ])
 );

 
  //stage54
 final stage54 = StageComponents(
  54,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-54',answer: ['<'],maxLength: 1,problem: [
    BlackBoard(56, 2, 13, 5, status:  FrameStatus.hard),
    Sentence(57, 4, str: "11*3   26+9", direction: SentenceDirection.horizontal),
    InputField(62, 4),
    InputBlock(58, 9, inputText: '<'),
    InputBlock(61, 9, inputText: '>'),
    InputBlock(64, 9, inputText: '='),
    InputBlock(67, 9, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(69, 0),Vector2.all(14)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Maze(11, 0, rank: 7, amount: 41, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<4;j++)
    Vector2(11, 1 + 3*j),
    for(double j=0;j<4;j++)
    Vector2(51, 1 + 3*j),
    Vector2(11, 16),Vector2(11, 19),Vector2(51, 16),Vector2(51, 19),Vector2(41, 7),Vector2(31, 4),
    for(double i=0;i<3;i++)
    Vector2(21 + 10*i, 10),
  ],
  eraces: [
    for(double i=0;i<21;i++)
    Vector2(10 + 2*i, 12),
    for(double i=0;i<21;i++)
    Vector2(10 + 2*i, 15),
    Vector2(14, 9),Vector2(16, 6),Vector2(17, 3),
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(32+i, 3, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(42+i, 6, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(49+i, 9, status: PlatformStatus.fallable)
  ]),
  Platform(2, 14, length: 3, fallable: false),
  Platform(56, 14, length: 19, fallable: false),
  Platform(6, 14, length: 3, fallable: false,
  path: Path()..lineTo(47*16, 0),pathDuration: 18),
  Breakables(51, 12, w: 1, h: 4, status: BreakableBlockStatus.chain)
 ]),
 enemies: EnemyLayer([
  SimpleMoveEnemy(21, 8, status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(31, 2, status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(41, 5, status: SimpleMoveEnemyStatus.slime, interval: 3),
  SimpleMoveEnemy(31, 8, status: SimpleMoveEnemyStatus.skelton, interval: 3),
  Dangers(12, 17, status: DangerObjectStatus.needle, length: 39, direction:DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(58 + i*3, 13, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(56, 13, status: HealItemStatus.pear),
  WeaponItem(48, 8, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  GoalBlock(72, 13, stageIndex: 54)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(57, 13, w: 12, status: DecorationStatus.seedLeaf, prob: 0.1),
  Decoration(12, 1, status: DecorationStatus.tSignboard),
  Sentence(2, 5, str: '3-54', direction: SentenceDirection.horizontal)
 ])
 );

  //stage55
 final stage55 = StageComponents(
  55,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-55',answer: ['<'],maxLength: 1,problem: [
    BlackBoard(54, 6, 13, 5, status:  FrameStatus.hard),
    Sentence(55, 8, str: "60/5   7+6", direction: SentenceDirection.horizontal),
    InputField(60, 8),
    InputBlock(56, 13, inputText: '<'),
    InputBlock(59, 13, inputText: '>'),
    InputBlock(62, 13, inputText: '='),
    InputBlock(65, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 3),Vector2.all(14)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2.all(0),Vector2(0, 2),Vector2(74, 2),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(29,3),Vector2(29, 12),Vector2(31, 12),Vector2(31, 3)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(18,19),Vector2(18, 8),Vector2(20, 8),Vector2(20, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(22,19),Vector2(22, 12),Vector2(24, 12),Vector2(24, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(26,19),Vector2(26, 15),Vector2(28, 15),Vector2(28, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(30,19),Vector2(30, 18),Vector2(32, 18),Vector2(32, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(50,19),Vector2(50, 11),Vector2(53, 11),Vector2(53, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(54,19),Vector2(54, 17),Vector2(74, 17),Vector2(74, 19)
  ]),
  Platform(2, 15, length: 3, fallable: false),
  Platform(7, 19, length: 3, fallable: false),
  Platform(7, 13, length: 11, fallable: false),
  Platform(32, 13, length: 3, fallable: false),
  Platform(42, 9, length: 3, fallable: false),
  Breakables(21, 3, w: 1, h: 17, status: BreakableBlockStatus.stalk),
  Breakables(25, 3, w: 1, h: 17, status: BreakableBlockStatus.stalk),
  Breakables(29, 13, w: 1, h: 7, status: BreakableBlockStatus.stalk),
 ]),
 enemies: EnemyLayer([
  Dangers(7, 3, status: DangerObjectStatus.icicle, length: 11, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(42, 8, status: SimpleMoveEnemyStatus.skelton, interval: 0),
  SimpleMoveEnemy(51, 10, status: SimpleMoveEnemyStatus.skelton, interval: 0),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(33, 12, status: HealItemStatus.pear),
  WeaponItem(8, 18, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 55)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(7, 12, w: 11, status: DecorationStatus.seedLeaf, prob: 0.1),
  RandomDecoration(54, 16, w: 16, status: DecorationStatus.seedLeaf, prob: 0.1),
  Sentence(2, 5, str: '3-55', direction: SentenceDirection.horizontal)
 ])
 );

  //stage56
 final stage56 = StageComponents(
  56,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-56',answer: ['<'],maxLength: 1,problem: [
    BlackBoard(36, 1, 16, 5, status:  FrameStatus.hard),
    Sentence(37, 3, str: "54/6+5   1+2*7", direction: SentenceDirection.horizontal),
    InputField(44, 3),
    InputBlock(38, 10, inputText: '<'),
    InputBlock(41, 10, inputText: '>'),
    InputBlock(44, 10, inputText: '='),
    InputBlock(47, 10, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(70, 14),Vector2.all(5)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.rectangle, gridPoints:[
    Vector2(35, 19),Vector2(35, 14),Vector2(52, 14),Vector2(52, 19)
  ]),
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(13, 7),Vector2(54, 2)
  ]),
  Platform(2, 15, length: 3, fallable: false),
  Platform(7, 11, length: 3, fallable: false),
  Platform(71, 17, length: 3, fallable: false),
  Platform(8, 17, length: 3, fallable: false,
  path: Path()..lineTo(58*16, 0),pathDuration: 30),
 ]),
 enemies: EnemyLayer([
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(38 + i*3, 13, status: SimpleMoveEnemyStatus.slime, interval: 2),
  Spawner(31, 6, status: SpawnerStatus.bugPot),
  Spawner(56, 6, status: SpawnerStatus.bugPot),
  Dangers(34, 14, status: DangerObjectStatus.needle, length:6, direction: DangerObjectDirection.right),
  Dangers(53, 14, status: DangerObjectStatus.needle, length:6, direction: DangerObjectDirection.left),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(7, 10, status: BitmanWeapon.sword),
 //HelmetItem(9, 10, status: BitmanHelmet.armor),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 56)
 ]),
 decorations: DecorationLayer([
  RandomDecoration(13, 6, w: 55, status: DecorationStatus.lTrunk, prob: 0.1),
  RandomDecoration(35, 13, w: 18, status: DecorationStatus.mTrunk, prob: 0.1),
  Sentence(2, 5, str: '3-56', direction: SentenceDirection.horizontal)
 ])
 );

  //stage57
 final stage57 = StageComponents(
  57,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-57',answer: ['>'],maxLength: 1,problem: [
    BlackBoard(33, 9, 13, 5, status:  FrameStatus.hard),
    Sentence(34, 11, str: "44-10   6*5", direction: SentenceDirection.horizontal),
    InputField(40, 11),
    InputBlock(35, 15, inputText: '<'),
    InputBlock(38, 15, inputText: '>'),
    InputBlock(41, 15, inputText: '='),
    InputBlock(44, 15, inputText: 'u'),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(46, 6),Vector2.all(13)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(0, 0),Vector2(0, 5),Vector2(74, 5),Vector2(74, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(33, 19),Vector2(33, 19),Vector2(46, 19),Vector2(46, 19)
  ]),
  Maze(6, 8, rank: 4, amount: 27, status: MassBlockStatus.normal,
  adds: [
    for(double j=0;j<3;j++)
    Vector2(6, 6 + j*3),
    Vector2(6, 18),Vector2(11, 9),Vector2(16, 12),
    for(double j=0;j<2;j++)
    Vector2(21, 6 + j*3),
    for(double j=0;j<4;j++)
    Vector2(32, 9 + j*3)
  ],
  eraces: [
    Vector2(8, 8),Vector2(8, 11),Vector2(14, 14),Vector2(22, 11),Vector2(26, 8),
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(13 + i, 8, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(17 + i, 11, status: PlatformStatus.fallable),
    for(double i=0;i<15;i++)
    PlatformBlock(17 + i, 14, status: PlatformStatus.fallable),
    for(double i=0;i<15;i++)
    PlatformBlock(17 + i, 17, status: PlatformStatus.fallable),
  ]),
  Maze(47, 8, rank: 4, amount: 28, status: MassBlockStatus.normal,
  adds: [
     Vector2(58, 9),Vector2(58, 12),Vector2(64, 12),Vector2(64, 15),Vector2(47, 18),
     for(double j=0;j<5;j++)
     Vector2(74, 6 + 3*j)
  ],
  eraces: [
    Vector2(59, 14),Vector2(61, 11)
  ],
  replaces: [
    for(double i=0;i<2;i++)
    PlatformBlock(49 + i, 11, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(53 + i, 14, status: PlatformStatus.fallable),
    for(double i=0;i<8;i++)
    PlatformBlock(53 + i, 17, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(65 + i, 11, status: PlatformStatus.fallable),
    for(double i=0;i<2;i++)
    PlatformBlock(68 + i, 14, status: PlatformStatus.fallable),
  ]),
  Platform(2, 15, length: 3, fallable: true),
  Breakables(13, 12, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(15, 9, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(28, 6, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(63, 9, w: 1, h: 2, status: BreakableBlockStatus.chain),
  Breakables(67, 12, w: 1, h: 2, status: BreakableBlockStatus.chain),
 ]),
 enemies: EnemyLayer([
  Dangers(53, 6, status: DangerObjectStatus.icicle, length: 8, direction: DangerObjectDirection.bottom),
  SimpleMoveEnemy(31, 10, status: SimpleMoveEnemyStatus.skelton, interval: 2),
  SimpleMoveEnemy(47, 10, status: SimpleMoveEnemyStatus.ghost2, interval: 2),
  SimpleMoveEnemy(65, 16, status: SimpleMoveEnemyStatus.skelton, interval: 0),
  SimpleMoveEnemy(73, 7, status: SimpleMoveEnemyStatus.ghost2, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(35 + i*3, 18, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  WeaponItem(31, 16, status: BitmanWeapon.sword),
  HealItem(48, 10, status: HealItemStatus.meat),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 57)
 ]),
 decorations: DecorationLayer([
  Decoration(6, 15, status: DecorationStatus.tSignboard),
  Sentence(2, 4, str: '3-57', direction: SentenceDirection.horizontal)
 ])
 );

  //stage58
 final stage58 = StageComponents(
  58,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-58',answer: ['='],maxLength: 1,problem: [
    BlackBoard(60, 7, 13, 5, status:  FrameStatus.hard),
    Sentence(61, 9, str: "39/13   9-6", direction: SentenceDirection.horizontal),
    InputField(67, 9),
    InputBlock(62, 14, inputText: '<'),
    InputBlock(65, 14, inputText: '>'),
    InputBlock(68, 14, inputText: '='),
    InputBlock(71, 14, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(72, 15),Vector2.all(3)
    ],eraces: [Vector2(73, 17)])
  ]),
 ]),
 platforms: PlatformLayer([
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(5, 10),Vector2(55, 2)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0, 19),Vector2(0, 18),Vector2(4, 18),Vector2(4, 19)
  ]),
  for(double i=0;i<5;i++)
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(15 + 10*i, 19),Vector2(15 + 10*i, 18),Vector2(16 + 10*i, 18),Vector2(16 + 10*i, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(60, 19),Vector2(60, 18),Vector2(74, 18),Vector2(74, 19)
  ]),
  Platform(5, 18, length: 10, fallable: true),
  for(double i=0;i<4;i++)
  Platform(17 + 10*i, 18, length: 8, fallable: true),
  Platform(57, 18, length: 3, fallable: true),
 ]),
 enemies: EnemyLayer([
  Dangers(17, 12, status: DangerObjectStatus.icicle, length: 43, direction: DangerObjectDirection.bottom),
  Dangers(5, 9, status: DangerObjectStatus.needle, length: 55, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  Dangers(25 + 10*i, 17, status: DangerObjectStatus.needle, length: 2, direction: DangerObjectDirection.bottom),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(62 + i*3, 17, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  TransformItem(15, 17, status:BitmanColor.speedYellow),
  HealItem(60, 17, status: HealItemStatus.apple),
  EndPosition(75, 0),
  GoalBlock(73, 17, stageIndex: 58)
 ]),
 decorations: DecorationLayer([
  Decoration(4, 17, status: DecorationStatus.bSignboard),
  RandomDecoration(60, 17, w: 12, status: DecorationStatus.seedLeaf, prob: 0.1),
  Sentence(7, 2, str: '3-58', direction: SentenceDirection.horizontal)
 ])
 );

   //stage59
 final stage59 = StageComponents(
  59,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-59',answer: ['>'],maxLength: 1,problem: [
    BlackBoard(54, 6, 18, 5, status:  FrameStatus.hard),
    Sentence(55, 8, str: "5*6-12   54/2-10", direction: SentenceDirection.horizontal),
    InputField(62, 8),
    InputBlock(59, 13, inputText: '<'),
    InputBlock(62, 13, inputText: '>'),
    InputBlock(65, 13, inputText: '='),
    InputBlock(68, 13, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(71, 14),Vector2.all(3)
    ],eraces: [Vector2(72, 16)])
  ]),
 ]),
 platforms: PlatformLayer([
  Platform(2, 17, length: 4, fallable:false),
  Platform(6, 19, length: 3, fallable:false),
  Platform(13, 19, length: 27, fallable:true),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(10, 19),Vector2(10, 6),Vector2(12, 6),Vector2(12, 19)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(40, 19),Vector2(40, 6),Vector2(42, 6),Vector2(42, 19)
  ]),
  Platform(45, 17, length:30, fallable: false)
 ]),
 enemies: EnemyLayer([
  Dangers(39, 6, status: DangerObjectStatus.needle, length: 13, direction: DangerObjectDirection.right),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(59 + i*3, 16, status: SimpleMoveEnemyStatus.slime, interval: 2),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  Spring(5, 16),
  TransformItem(7, 18, status:BitmanColor.speedYellow),
  EndPosition(75, 0),
  GoalBlock(72, 16, stageIndex: 59)
 ]),
 decorations: DecorationLayer([
  Decoration(11, 5, status: DecorationStatus.bSignboard),
  RandomDecoration(45, 16, w: 26, status: DecorationStatus.sTrunk, prob: 0.1),
  Sentence(3, 2, str: '3-59', direction: SentenceDirection.horizontal)
 ])
 );

   //stage60
 final stage60 = StageComponents(
  60,
 background:BackgroundLayer(status: BackgroundStatus.ailian),
 backgroundDecorations: BackgroundDecorationLayer(
  [
    Chimney(18, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(38, 0, length: 20, direction: ChimneyDirection.vertical),
    Chimney(65, 0, length: 20, direction: ChimneyDirection.vertical),
  ]
 ),
 problems: ProblemLayer([
    Problem(id: '3-60-1',answer: ['4'],maxLength: 1,problem: [
    BlackBoard(34, 4, 13, 5, status:  FrameStatus.hard),
    Sentence(38, 5, str: "X = Y", direction: SentenceDirection.horizontal),
    Sentence(36, 6, str: "5*X = 24-Y", direction: SentenceDirection.horizontal),
    Sentence(36, 7, str: "→ X = ", direction: SentenceDirection.horizontal),
    InputField(42, 7),
    InputBlock(38, 10, inputText: '4'),
    InputBlock(41, 10, inputText: '6'),
    InputBlock(44, 10, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(47, 8),Vector2.all(5)
    ])
  ]),
  Problem(id: '3-60-2',answer: ['='],maxLength: 1,problem: [
    BlackBoard(53, 4, 17, 5, status:  FrameStatus.hard),
    Sentence(54, 6, str: "22*2-11   4*7+5", direction: SentenceDirection.horizontal),
    InputField(62, 6),
    InputBlock(56, 10, inputText: '<'),
    InputBlock(59, 10, inputText: '>'),
    InputBlock(62, 10, inputText: '='),
    InputBlock(65, 10, inputText: 'u'),
    Lockeds(status: LockedsStatus.rectangle, gridPoints: [
      Vector2(66, 13),Vector2.all(5)
    ],eraces: [
      for(double i=0;i<5;i++)
      Vector2(66+i, 17)
    ]),
    Lockeds(status: LockedsStatus.vertical, gridPoints: [
      Vector2(70, 2),Vector2.all(11)
    ])
  ]),
 ]),
 platforms: PlatformLayer([
  // Grnd(status: GrndStatus.invertedRect, gridPoints: [
  //   Vector2(27,0),Vector2(27, 12),Vector2(31, 12),Vector2(31, 0)
  // ]),
  Grnd(status: GrndStatus.invertedRect, gridPoints: [
    Vector2(51,0),Vector2(51, 1),Vector2(53, 1),Vector2(53, 0)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(0,19),Vector2(0, 17),Vector2(8, 17),Vector2(8, 19)
  ]),
  Grnd(status: GrndStatus.floatingRect, gridPoints: [
    Vector2(9,6),Vector2(5, 12)
  ]),
  Grnd(status: GrndStatus.rectangle, gridPoints: [
    Vector2(14,19),Vector2(14, 17),Vector2(74, 17),Vector2(74, 19)
  ]),

  Platform(20, 15, length: 3, fallable: false,
 path: Path()
  ..lineTo(20*16, 0),pathDuration: 17.5
  ), 
  Platform(32, 15, length: 3, fallable: false,
  path: Path()
  ..lineTo(3*16, -2*16)
  ..lineTo(6*16, 0)
  ..lineTo(9*16, -2*16)
  ..lineTo(12*16, 0*16)
  ..lineTo(18*16, 0)
  ..lineTo(21*16, -2*16)
  ..lineTo(24*16, 0)
  ..lineTo(27*16, -2*16)
  ..lineTo(30*16, 0)
  ,pathDuration: 14),
  Breakables(51, 2, w: 3, h: 15, status: BreakableBlockStatus.chain),
 ]),
 enemies: EnemyLayer([
  // for(double i=0;i<3;i++)
  // Skelton(38 + 3*i, 16, status: SkeltonStatus.bug, interval: 2),
  for(double i=0;i<4;i++)
  SimpleMoveEnemy(56 +3*i, 16, status: SimpleMoveEnemyStatus.slime, interval: 3),
  for(double i=0;i<3;i++)
  SimpleMoveEnemy(4 +2*i, 11-3*i, status: SimpleMoveEnemyStatus.bat, interval: 3),
 ]),
 objects: ObjectLayer([
  StartPosition(0, 0),
  HealItem(68, 16, status: HealItemStatus.pear),
  WeaponItem(49, 10, status: BitmanWeapon.sword),
  EndPosition(75, 0),
  Entrance(73, 16, stageIndex: -3, status: EntranceBlockStatus.open)
 ]),
 decorations: DecorationLayer([
  Cords(49,2,w:1,h:8,status:CordBlockStatus.thread),
  RandomDecoration(14, 16, w: 38, status: DecorationStatus.seedLeaf, prob: 0.2),
  RandomDecoration(53, 16, w: 13, status: DecorationStatus.seedLeaf, prob: 0.2),
  Decoration(11, 5, status: DecorationStatus.bSignboard),
  Sentence(3, 2, str: '3-60', direction: SentenceDirection.horizontal)
 ])
 );