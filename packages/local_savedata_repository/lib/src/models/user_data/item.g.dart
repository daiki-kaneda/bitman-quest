// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      $enumDecode(_$ItemTypeEnumMap, json['type']),
      json['count'] as int,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'type': _$ItemTypeEnumMap[instance.type]!,
      'count': instance.count,
    };

const _$ItemTypeEnumMap = {
  ItemType.speedUp: 'speedUp',
  ItemType.powerUp: 'powerUp',
  ItemType.healthUp: 'healthUp',
};
