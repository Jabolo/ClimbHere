import 'dart:io';

import 'package:climb_here_flutter/app/modules/shared/models/gym_model.dart';
import 'package:climb_here_flutter/app/modules/shared/models/wall_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';

class GymRepository extends Disposable {
  final Dio dio;

  GymRepository({this.dio});

  Future<List<GymModel>> findAllGyms(GymModel filter) async {
    Response<List> response = await dio.put('/gym/search', data: filter);
    if (_successResponse(response)) {
      return response.data
          .map<GymModel>((json) => GymModel.fromJson(json))
          .toList();
    } else
      return null;
  }

  Future<List<WallModel>> uploadWalls(List<File> wallsImages) async {
    var formData = FormData();
    formData.files.addAll(wallsImages.map<MapEntry<String, MultipartFile>>(
        (image) => _createMapEntryFromFile(image)));
    // Call API.
    Response<List> response =
        await dio.post<List>('/amazon/walls', data: formData);
    if (_successResponse(response))
      return response.data
          .map<WallModel>((json) => WallModel.fromJson(json))
          .toList();
    else
      return null;
  }

  MapEntry<String, MultipartFile> _createMapEntryFromFile(File image) {
    return MapEntry<String, MultipartFile>('walls',
        MultipartFile.fromFileSync(image.path, filename: basename(image.path)));
  }

  Future<GymModel> insertGym(GymModel gymModel) async {
    Response<Map> response = await dio.post('/gym', data: gymModel);
    if (_successResponse(response)) {
      return GymModel.fromJson(response.data);
    } else
      return null;
  }

  @override
  void dispose() {}

  bool _successResponse(Response response) =>
      response.statusCode >= 200 && response.statusCode < 300;
}
