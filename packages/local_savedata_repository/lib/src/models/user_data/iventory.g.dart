// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Iventory _$IventoryFromJson(Map<String, dynamic> json) => Iventory(
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IventoryToJson(Iventory instance) => <String, dynamic>{
      'items': instance.items,
    };
