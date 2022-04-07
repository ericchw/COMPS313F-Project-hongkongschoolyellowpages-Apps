import 'package:json_annotation/json_annotation.dart';

part 'schoolInfo.g.dart';

@JsonSerializable()
class SchoolInfo {
  SchoolInfo();

  late String objectIdFieldName;
  late Map<String,dynamic> uniqueIdField;
  late String globalIdFieldName;
  late String geometryType;
  late Map<String,dynamic> spatialReference;
  late List fields;
  late bool exceededTransferLimit;
  late List features;
  
  factory SchoolInfo.fromJson(Map<String,dynamic> json) => _$SchoolInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolInfoToJson(this);
}
