import 'dart:convert';
import 'dart:ffi';

import 'package:local_savedata_repository/src/models/setting_data.dart';
import 'package:local_savedata_repository/src/models/stats_data.dart';
import 'package:local_savedata_repository/src/models/user_data/game_progress.dart';
import 'package:local_savedata_repository/src/models/user_data/iventory.dart';
import 'package:local_savedata_repository/src/models/user_data/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSavedataRepository{
  LocalSavedataRepository({required SharedPreferences plugin})
  :_plugin=plugin;

  final SharedPreferences _plugin;

  //userdata key
  static const kUserDataKey = '--user-data-key';
    UserData getUserData(){
      final jsonString = _plugin.getString(kUserDataKey);
      if(jsonString!=null){
        return UserData.fromJson(jsonDecode(jsonString) as Map<String,dynamic>);
      }else{
        //初期のユーザデータ
        return UserData(
          GameProgress(),
           Iventory(items: []),
           0);
      }
  }

  Future<void> saveUserData(UserData value)async{
    final jsonString = jsonEncode(value);
    await _plugin.setString(kUserDataKey, jsonString);
  }

  //setting key
  static const kSettingDataKey = '--setting-data-key';

  SettingData getSettingData(){
      final jsonString = _plugin.getString(kSettingDataKey);
      if(jsonString!=null){
        return SettingData.fromJson(jsonDecode(jsonString) as Map<String,dynamic>);
      }else{
        return SettingData(isBGM: true, isSfx: true);
      }
  }

  Future<void> saveSettingData(SettingData value)async{
    final jsonString = jsonEncode(value);
    await _plugin.setString(kSettingDataKey, jsonString);
  }

  //stats key
  static const kStatsDataKey = '--stats-data-key';

  StatsData getStatsData(){
      final jsonString = _plugin.getString(kStatsDataKey);
      if(jsonString!=null){
        return StatsData.fromJson(jsonDecode(jsonString) as Map<String,dynamic>);
      }else{
        return StatsData();
      }
  }

  Future<void> saveStatsData(StatsData value)async{
    final jsonString = jsonEncode(value);
    await _plugin.setString(kStatsDataKey, jsonString);
  }
}