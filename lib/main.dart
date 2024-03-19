import 'package:bitman_quest/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_savedata_repository/local_savedata_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight
  ]);
  final savedataRepository = LocalSavedataRepository(
    plugin: await SharedPreferences.getInstance()
    );
  final game = BitmanQuest(savedata: savedataRepository);
  runApp(
    GameWidget(game: game)
  );
}

