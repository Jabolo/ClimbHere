import 'package:json_annotation/json_annotation.dart';
import './wall_model.dart';

part 'gym_model.g.dart';

@JsonSerializable()
class GymModel {
  GymModel({
    this.gymID,
    this.gymName,
    this.walls
  });

  String gymID;
  String gymName;
  List<WallModel> walls;

  factory GymModel.fromJson(Map<String, dynamic> json) => _$GymModelFromJson(json);
  Map<String, dynamic> toJson() => _$GymModelToJson(this);
}