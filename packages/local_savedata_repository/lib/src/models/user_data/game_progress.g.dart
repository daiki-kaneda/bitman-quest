// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameProgress _$GameProgressFromJson(Map<String, dynamic> json) => GameProgress(
      stages: (json['stages'] as List<dynamic>?)
              ?.map((e) => Stage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GameProgressToJson(GameProgress instance) =>
    <String, dynamic>{
      'stages': instance.stages,
    };
