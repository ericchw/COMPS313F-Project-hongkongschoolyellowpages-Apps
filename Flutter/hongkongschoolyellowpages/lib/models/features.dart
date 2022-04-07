import 'package:json_annotation/json_annotation.dart';

part 'features.g.dart';

@JsonSerializable()
class Features {
  Features();

  late List features;
  
  factory Features.fromJson(Map<String,dynamic> json) => _$FeaturesFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturesToJson(this);
}
