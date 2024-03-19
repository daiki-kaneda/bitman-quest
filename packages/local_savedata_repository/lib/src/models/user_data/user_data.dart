import 'package:local_savedata_repository/src/models/user_data/game_progress.dart';
import 'package:local_savedata_repository/src/models/user_data/iventory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';
@JsonSerializable()
class UserData{
  UserData(this.progress,this.iventory,this.sapphire);

  final GameProgress progress;
  final Iventory iventory;
  final int sapphire;

  factory UserData.fromJson(Map<String,dynamic> json)
  =>_$UserDataFromJson(json);

  Map<String,dynamic> toJson()=>_$UserDataToJson(this);

  UserData copyWith({
    GameProgress? progress,
    Iventory? iventory,
    int? sapphire,
  }){
    return UserData(
      progress ?? this.progress,
     iventory ?? this.iventory,
      sapphire ?? this.sapphire);
  }
}

