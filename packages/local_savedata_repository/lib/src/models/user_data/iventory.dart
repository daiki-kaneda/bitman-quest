import 'package:json_annotation/json_annotation.dart';
import 'package:local_savedata_repository/src/models/user_data/item.dart';

part 'iventory.g.dart';
@JsonSerializable()
class Iventory{
  Iventory({required this.items});

  final List<Item> items;

  Map<String,dynamic> toJson()=>_$IventoryToJson(this);

  factory Iventory.fromJson(Map<String,dynamic> json)
  =>_$IventoryFromJson(json);
}