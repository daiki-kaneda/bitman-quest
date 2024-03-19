
import 'dart:math';

import 'package:bitman_quest/screens/stage_select_page/tiles/entrance_tile.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/ground_tile.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/river_tile.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/road_tile.dart';
import 'package:bitman_quest/screens/stage_select_page/tiles/tile.dart';
import 'package:flame/components.dart';

//layer1
final List<Tile> layer1 = [
  for(double i=0;i<100;i++)
  for(double j=0;j<100;j++)
  GroundTile(Random().nextInt(4)+1, i, j)..priority = 0
];

//layer2
final List<Tile> layer2 = [
  for(double i=0;i<48;i++)
  RiverTile(FencePosition.top, i, 48),
  for(double i=52;i<100;i++)
  RiverTile(FencePosition.top, i, 48),

  for(double i=0;i<48;i++)
  RiverTile(FencePosition.bottom, i, 51),
  for(double i=52;i<100;i++)
  RiverTile(FencePosition.bottom, i, 51),

  for(double j=0;j<48;j++)
  RiverTile(FencePosition.left, 48, j),
  for(double j=52;j<100;j++)
  RiverTile(FencePosition.left, 48, j),

  for(double j=0;j<48;j++)
  RiverTile(FencePosition.right, 51, j),
  for(double j=52;j<100;j++)
  RiverTile(FencePosition.right, 51, j),

  RiverTile(FencePosition.bottomLeft, 48, 51),
  RiverTile(FencePosition.bottomRight, 51, 51),
  RiverTile(FencePosition.topLeft, 48, 48),
  RiverTile(FencePosition.topRight, 51, 48),

  RiverTile(FencePosition.none, 49, 49),
  RiverTile(FencePosition.none, 49, 50),
  RiverTile(FencePosition.none, 50, 49),
  RiverTile(FencePosition.none, 50, 50),

  for(double i=0;i<49;i++)
  RiverTile(FencePosition.none, i, 49),
  for(double i=0;i<49;i++)
  RiverTile(FencePosition.none, i, 50),

  for(double i=51;i<100;i++)
  RiverTile(FencePosition.none, i, 49),
  for(double i=51;i<100;i++)
  RiverTile(FencePosition.none, i, 50),

  for(double j=0;j<49;j++)
  RiverTile(FencePosition.none, 49, j),
  for(double j=0;j<49;j++)
  RiverTile(FencePosition.none, 50, j),

  for(double j=51;j<100;j++)
  RiverTile(FencePosition.none, 49, j),
  for(double j=51;j<100;j++)
  RiverTile(FencePosition.none, 50, j),
].map((t) => t..priority=1).toList();


//layer3
final layer3 = [
  RoadTile(status: RoadStatus.deadEndLeft, lastStageIndex: 0, x: 0, y: 99),
  for(double i=1;i<4;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 0, x: i, y: 99),
  RoadTile(status: RoadStatus.turnUpRight, lastStageIndex: 0, x: 4, y: 99),
  for(double j=98;j>=94;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 0, x: 4, y: j),
  RoadTile(status: RoadStatus.turnDownLeft, lastStageIndex: 0, x: 4, y: 93),
  for(double i=5;i<=8;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 0, x: i, y: 93),
  EntranceTile(1, 9, 93),
  for(double j=92;j>=91;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 1, x: 9, y: j),
  RoadTile(status: RoadStatus.turnDownLeft, lastStageIndex: 1, x: 9, y: 90),
  for(double i=10;i<=18;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 1, x: i, y: 90),
  EntranceTile(2, 19, 90),
  for(double i=20;i<=23;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 2, x: i, y: 90),
  RoadTile(status: RoadStatus.turnDownRight, lastStageIndex: 2, x: 24, y: 90),
  for(double j=91;j<=93;j++)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 2, x: 24, y: j),
  EntranceTile(3, 24, 94),
  for(double i=25;i<=32;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 3, x: i, y: 94),
  RoadTile(status: RoadStatus.turnUpRight, lastStageIndex: 3, x: 33, y: 94),
  for(double j=93;j>=91;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 3, x: 33, y: j),
  EntranceTile(4, 33, 90),
  RoadTile(status: RoadStatus.turnDownLeft, lastStageIndex: 4, x: 33, y: 89),
  for(double i=34;i<=37;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 4, x: i, y: 89),
  RoadTile(status: RoadStatus.turnUpRight, lastStageIndex: 4, x: 38, y: 89),
  for(double j=88;j>=84;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 4, x: 38, y: j),
  RoadTile(status: RoadStatus.turnDownRight, lastStageIndex: 4, x: 38, y: 83),
  EntranceTile(5, 37, 83),
  for(double i=36;i>=25;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 5, x: i, y: 83),
  RoadTile(status: RoadStatus.turnUpLeft, lastStageIndex: 5, x: 24, y: 83),
  EntranceTile(6, 24, 82),
  RoadTile(status: RoadStatus.turnDownRight, lastStageIndex: 6, x: 24, y: 81),
  for(double i=23;i>=13;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 6, x: i, y: 81),
  EntranceTile(7, 12, 81),
  for(double i=11;i>=3;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 7, x: i, y: 81),
  RoadTile(status: RoadStatus.turnUpLeft, lastStageIndex: 7, x: 2, y: 81),
  EntranceTile(8, 2, 80),
  for(double j=79;j>=72;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 8, x: 2, y: j),
  EntranceTile(9, 2, 71),
  for(double i=3;i<=18;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 9, x: i, y: 71),
  EntranceTile(10, 19, 71),
  for(double i=20;i<=27;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 10, x: i, y: 71),
  RoadTile(status: RoadStatus.turnDownRight, lastStageIndex: 10, x: 28, y: 71),
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 10, x: 28, y: 72),
  EntranceTile(11, 28, 73),
  for(double i=29;i<=36;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 11, x: i, y: 73),
  RoadTile(status: RoadStatus.turnDownRight, lastStageIndex: 11, x: 37, y: 73),
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 11, x: 37, y: 74),
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 11, x: 37, y: 75),
  EntranceTile(12, 37, 76),
  for(double i=38;i<=42;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 12, x: i, y: 76),
  RoadTile(status: RoadStatus.turnUpRight, lastStageIndex: 12, x: 43, y: 76),
  for(double j=75;j>=72;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 12, x: 43, y: j),
  EntranceTile(13, 43, 71),
  for(double i=42;i>=35;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 13, x: i, y: 71),
  RoadTile(status: RoadStatus.turnUpLeft, lastStageIndex: 13, x: 34, y: 71),
  for(double j=70;j>=64;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 13, x: 34, y: j),
  EntranceTile(14, 34, 63),
  for(double i=33;i>=21;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 14, x: i, y: 63),
  EntranceTile(15, 20, 63),
  for(double i=19;i>=8;i--)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 15, x: i, y: 63),
  EntranceTile(16, 7, 63),
  for(double j=62;j>=55;j--)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 16, x: 7, y: j),
  EntranceTile(17, 7, 54),
  for(double i=8;i<=16;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 17, x: i, y: 54),
  EntranceTile(18, 17, 54),
  for(double i=18;i<=27;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 18, x: i, y: 54),
  EntranceTile(19, 28, 54),
  for(double i=29;i<=36;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 19, x: i, y: 54),
  EntranceTile(20, 37, 54),
  for(double i=38;i<=45;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 20, x: i, y: 54),
  EntranceTile(21, 46, 54),
  for(double j=55;j<=60;j++)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 21, x: 46, y: j),

  for(double i=0;i<3;i++)
  for(double j=0;j<3;j++)
    RoadTile(status: RoadStatus.red, lastStageIndex: 21, x: 45+i, y: 61+j),
  EntranceTile(22, 46, 62,status: EntranceStatus.golem),
  for(double i=0;i<4;i++)
  for(double j=0;j<3;j++)
    RoadTile(status: RoadStatus.bridge, lastStageIndex: 22, x: 48+i, y: 61+j),
  
  for(double i=0;i<6;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 22, x: 52+i, y: 62),
  EntranceTile(23, 58, 62),
  for(double i=0;i<8;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 23, x: 59+i, y: 62),
  EntranceTile(24, 67, 62),
  for(double j=0;j<9;j++)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 24, x: 67, y: 63+j),
  EntranceTile(25, 67, 72),
  for(double i=0;i<9;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 25, x: 58+i, y: 72),
  EntranceTile(26, 57, 72),
  for(double j=0;j<12;j++)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 26, x: 57, y: 73+j),
  EntranceTile(27, 57, 85),
  for(double j=0;j<6;j++)
  RoadTile(status: RoadStatus.vertical, lastStageIndex: 27, x: 57, y: 86+j),
  EntranceTile(28, 57, 92),
  for(double i=0;i<8;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 28, x: 58+i, y: 92),
  EntranceTile(29, 66, 92),
  for(double i=0;i<5;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 29, x: 67+i, y: 92),
  EntranceTile(30, 72, 92),
  for(double i=73;i<=79;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 30, x: i, y: 92),
  EntranceTile(31, 80, 92),
  for(double i=81;i<=86;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 31, x: i, y: 92),
  EntranceTile(32, 87, 92),
  for(double i=88;i<=92;i++)
  RoadTile(status: RoadStatus.horizontal, lastStageIndex: 32, x: i, y: 92),
  EntranceTile(33, 93, 92),
  ...road(Vector2(93, 85), Vector2(93, 91), stageIndex: 33,isHorizontal: false),
  EntranceTile(34, 93, 84),
  ...road(Vector2(93, 78), Vector2(93, 83), stageIndex: 34,isHorizontal: false),
  EntranceTile(35, 93, 77),
  ...road(Vector2(86, 77), Vector2(92, 77), stageIndex: 35),
  EntranceTile(36, 85, 77),
  ...road(Vector2(85, 68), Vector2(85, 76), stageIndex: 36,isHorizontal: false),
  EntranceTile(37, 85, 67),
  ...road(Vector2(85, 61), Vector2(85, 66), stageIndex: 37,isHorizontal: false),
  EntranceTile(38, 85, 60),
  ...road(Vector2(85, 56), Vector2(85, 59), stageIndex: 38,isHorizontal: false),
  EntranceTile(39, 85, 55),
  ...road(Vector2(78, 55), Vector2(84, 55), stageIndex: 39),
  for(double i=0;i<7;i++)
  for(double j=0;j<6;j++)
    RoadTile(status: RoadStatus.red, lastStageIndex: 39, x: 71+i, y: 52+j),
  EntranceTile(40, 74, 55,status: EntranceStatus.wizard),
  for(double i=0;i<3;i++)
  for(double j=0;j<4;j++)
    RoadTile(status: RoadStatus.bridge, lastStageIndex: 40, x: 73+i, y: 48+j),
  ...road(Vector2(74, 45), Vector2(74, 47), stageIndex: 40,isHorizontal: false),
  EntranceTile(41, 74, 44),
  ...road(Vector2(75, 44), Vector2(85, 44), stageIndex: 41),
  EntranceTile(42, 86, 44),
  ...road(Vector2(87, 44), Vector2(95, 44), stageIndex: 42),
  EntranceTile(43, 96, 44),
  ...road(Vector2(96, 36), Vector2(96, 43), stageIndex: 43,isHorizontal: false),
  EntranceTile(44, 96, 35),
  ...road(Vector2(86, 35), Vector2(95, 35), stageIndex: 44),
  EntranceTile(45, 85, 35),
  ...road(Vector2(75, 35), Vector2(84, 35), stageIndex: 45),
  EntranceTile(46, 74, 35),
  ...road(Vector2(74, 29), Vector2(74, 34), stageIndex: 46,isHorizontal: false),
  EntranceTile(47, 74, 28),
  ...road(Vector2(75, 28), Vector2(85, 28), stageIndex: 47),
  EntranceTile(48, 86, 28),
  ...road(Vector2(86, 18), Vector2(86, 27), stageIndex: 48,isHorizontal: false),
  EntranceTile(49, 86, 17),
  ...road(Vector2(87, 17), Vector2(94, 17), stageIndex: 49),
  EntranceTile(50, 95, 17),
  ...road(Vector2(95, 6), Vector2(95, 16), stageIndex: 50,isHorizontal: false),
  EntranceTile(51, 95, 5),
  ...road(Vector2(82, 5), Vector2(94, 5), stageIndex: 51),
  EntranceTile(52, 81, 5),
  ...road(Vector2(76, 5), Vector2(80, 5), stageIndex: 52),
  EntranceTile(53, 75, 5),
  ...road(Vector2(67, 5), Vector2(74, 5), stageIndex: 53),
  EntranceTile(54, 66, 5),
  ...road(Vector2(66, 6), Vector2(66, 11), stageIndex: 54,isHorizontal: false),
  EntranceTile(55, 66, 12),
  ...road(Vector2(56, 12), Vector2(65, 12), stageIndex: 55),
  EntranceTile(56, 55, 12),
  ...road(Vector2(55, 13), Vector2(55, 15), stageIndex: 56,isHorizontal: false),
  EntranceTile(57, 55, 16),
  ...road(Vector2(56, 16), Vector2(63, 16), stageIndex: 57),
  EntranceTile(58, 64, 16),
  ...road(Vector2(64, 17), Vector2(64, 23), stageIndex: 58,isHorizontal: false),
  EntranceTile(59, 64, 24),
  ...road(Vector2(58, 24), Vector2(63, 24), stageIndex: 59),
  for(double i=0;i<6;i++)
  for(double j=0;j<5;j++)
    RoadTile(status: RoadStatus.red, lastStageIndex: 59, x: 52+i, y: 22+j),
  EntranceTile(60,55, 24,status: EntranceStatus.ghost),
  for(double i=0;i<4;i++)
  for(double j=0;j<3;j++)
    RoadTile(status: RoadStatus.bridge, lastStageIndex: 60, x: 48+i, y: 24+j),
  ...road(Vector2(45, 25), Vector2(47, 25), stageIndex: 60),
  EntranceTile(61, 44, 25),
  ...road(Vector2(44, 26), Vector2(44, 31), stageIndex: 61,isHorizontal: false),
  EntranceTile(62, 44, 32),
  ...road(Vector2(44, 33), Vector2(44, 41), stageIndex: 62,isHorizontal: false),
  EntranceTile(63, 44, 42),
  ...road(Vector2(37, 42), Vector2(43, 42), stageIndex: 63),
  EntranceTile(64, 36, 42),
  ...road(Vector2(36, 32), Vector2(36,41), stageIndex: 64,isHorizontal: false),
  EntranceTile(65, 36, 31),
  ...road(Vector2(36, 26), Vector2(36,30), stageIndex: 65,isHorizontal: false),
  EntranceTile(66, 36, 25),
  ...road(Vector2(36, 19), Vector2(36,24), stageIndex: 66,isHorizontal: false),
  EntranceTile(67, 36, 18),
  ...road(Vector2(36, 6), Vector2(36,17), stageIndex: 67,isHorizontal: false),
  EntranceTile(68, 36, 5),
  ...road(Vector2(34, 5), Vector2(35,5), stageIndex: 68),
  EntranceTile(69, 33, 5),
  ...road(Vector2(33, 6), Vector2(33,21), stageIndex: 69,isHorizontal: false),
  EntranceTile(70, 33, 22),
  ...road(Vector2(27, 22), Vector2(32,22), stageIndex: 70),
  EntranceTile(71, 26, 22),
  ...road(Vector2(26, 23), Vector2(26,40), stageIndex: 71,isHorizontal: false),
  EntranceTile(72, 26, 41),
  ...road(Vector2(14, 41), Vector2(25, 41), stageIndex: 72),
  EntranceTile(73, 13, 41),
  ...road(Vector2(5, 41), Vector2(12, 41), stageIndex: 73),
  EntranceTile(74, 4, 41),
  ...road(Vector2(4, 28), Vector2(4, 40), stageIndex: 74,isHorizontal: false),
  EntranceTile(75, 4, 27),
  ...road(Vector2(4, 5), Vector2(4, 26), stageIndex: 75,isHorizontal: false),
  EntranceTile(76, 4, 4),
  ...road(Vector2(5, 4), Vector2(20, 4), stageIndex: 76),
  EntranceTile(77, 21, 4),
  ...road(Vector2(21, 5), Vector2(21, 7), stageIndex: 77,isHorizontal: false),
  EntranceTile(78, 21, 8),
  ...road(Vector2(21, 9), Vector2(21, 23), stageIndex: 78,isHorizontal: false),
  EntranceTile(79, 21, 24),
  for(double i=0;i<11;i++)
  for(double j=0;j<9;j++)
    RoadTile(status: RoadStatus.red, lastStageIndex: 79, x: 10+i, y: 20+j),
  EntranceTile(80,15, 24,status: EntranceStatus.swordsman),
].map((t) => t..priority=2).toList();

//useful function for layer3
List<Tile> road(
  Vector2 start,
  Vector2 end,
  {required int stageIndex,
  bool isHorizontal = true}){
    if(isHorizontal){
       assert(start.x<end.x);
      return <Tile>[
        for(double i=start.x;i<= end.x;i++)
        RoadTile(status: RoadStatus.horizontal, lastStageIndex:stageIndex, x:i, y: start.y)
      ];
    }else{
       assert(start.y<end.y);
       return <Tile>[
        for(double j=start.y;j<= end.y;j++)
        RoadTile(status: RoadStatus.vertical, lastStageIndex:stageIndex, x:start.x, y:j)
      ];
    }
}

//TODO need implement layer4,layer5
