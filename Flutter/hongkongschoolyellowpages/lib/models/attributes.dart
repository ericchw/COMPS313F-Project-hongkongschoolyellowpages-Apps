import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
class Attributes {
  Attributes();

  late Map<String,dynamic> attributes;
  late Map<String,dynamic> geometry;
  
  factory Attributes.fromJson(Map<String,dynamic> json) => _$AttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
