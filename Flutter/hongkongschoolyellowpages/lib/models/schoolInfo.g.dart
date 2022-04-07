// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schoolInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfo _$SchoolInfoFromJson(Map<String, dynamic> json) => SchoolInfo()
  ..objectIdFieldName = json['objectIdFieldName'] as String
  ..uniqueIdField = json['uniqueIdField'] as Map<String, dynamic>
  ..globalIdFieldName = json['globalIdFieldName'] as String
  ..geometryType = json['geometryType'] as String
  ..spatialReference = json['spatialReference'] as Map<String, dynamic>
  ..fields = json['fields'] as List<dynamic>
  ..exceededTransferLimit = json['exceededTransferLimit'] as bool
  ..features = json['features'] as List<dynamic>;

Map<String, dynamic> _$SchoolInfoToJson(SchoolInfo instance) =>
    <String, dynamic>{
      'objectIdFieldName': instance.objectIdFieldName,
      'uniqueIdField': instance.uniqueIdField,
      'globalIdFieldName': instance.globalIdFieldName,
      'geometryType': instance.geometryType,
      'spatialReference': instance.spatialReference,
      'fields': instance.fields,
      'exceededTransferLimit': instance.exceededTransferLimit,
      'features': instance.features,
    };
