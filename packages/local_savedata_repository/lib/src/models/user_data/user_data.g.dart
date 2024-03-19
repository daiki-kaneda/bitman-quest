// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      GameProgress.fromJson(json['progress'] as Map<String, dynamic>),
      Iventory.fromJson(json['iventory'] as Map<String, dynamic>),
      json['sapphire'] as int,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'progress': instance.progress,
      'iventory': instance.iventory,
      'sapphire': instance.sapphire,
    };
