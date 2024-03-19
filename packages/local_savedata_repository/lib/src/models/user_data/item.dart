
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

enum ItemType{
  speedUp,powerUp,healthUp
}

@JsonSerializable()
class Item{
  Item(this.type,this.count);

  final ItemType type;
  final int count;

  Map<String,dynamic> toJson()=>_$ItemToJson(this);

  factory Item.fromJson(Map<String,dynamic> json)=>_$ItemFromJson(json);
}


