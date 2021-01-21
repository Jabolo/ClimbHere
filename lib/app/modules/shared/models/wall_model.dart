import 'package:json_annotation/json_annotation.dart';

part 'wall_model.g.dart';

@JsonSerializable()
class WallModel {
  WallModel({this.wallImageURL});

  String wallImageURL;

  factory WallModel.fromJson(Map<String, dynamic> json) =>
      _$WallModelFromJson(json);

  Map<String, dynamic> toJson() => _$WallModelToJson(this);
}
