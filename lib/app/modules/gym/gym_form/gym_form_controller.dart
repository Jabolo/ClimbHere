import 'dart:io';

import 'package:climb_here_flutter/app/modules/shared/models/gym_model.dart';
import 'package:climb_here_flutter/app/modules/shared/repository/gym_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'gym_form_controller.g.dart';

class GymFormController = _GymFormControllerBase with _$GymFormController;

abstract class _GymFormControllerBase with Store {
  GymRepository _gymRepository = Modular.get();

  GymModel savedGym;
  setSavedGym(GymModel gymModel) => savedGym = gymModel;

  @observable
  GymFormState gymFormState = GymFormState.IDLE;

  @action
  saveGym(Map<String, dynamic> form) async{
    // Set state to Loading to disable form and save button.
    gymFormState = GymFormState.LOADING;

    List walls = form['walls'] as List;
    String gymName = form['gymName'] as String;

    //get list of walls that would be send to S3
    List<File> wallsNotSaved = walls.where((image) => image is File).whereType<File>().toList();
  if(savedGym == null){
    GymModel gymModel = GymModel(
      walls: await _gymRepository.uploadWalls(wallsNotSaved),
      gymName: gymName
    );

    await _gymRepository.insertGym(gymModel);
    Modular.to.pop();
    gymFormState = GymFormState.IDLE;
  }
  else
    {
    // TODO: Update Gym Here
    }
  gymFormState = GymFormState.IDLE;
  }
}

enum GymFormState { IDLE, LOADING }