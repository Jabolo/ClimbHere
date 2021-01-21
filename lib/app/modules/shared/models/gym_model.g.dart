// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymModel _$GymModelFromJson(Map<String, dynamic> json) {
  return GymModel(
    gymID: json['gymID'] as String,
    gymName: json['gymName'] as String,
    walls: (json['walls'] as List)
        ?.map((e) =>
            e == null ? null : WallModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GymModelToJson(GymModel instance) => <String, dynamic>{
      'gymID': instance.gymID,
      'gymName': instance.gymName,
      'walls': instance.walls,
    };
