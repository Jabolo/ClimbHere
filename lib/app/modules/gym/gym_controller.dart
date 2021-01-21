import 'package:climb_here_flutter/app/modules/shared/models/gym_model.dart';
import 'package:climb_here_flutter/app/modules/shared/repository/gym_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'gym_controller.g.dart';

class GymController = _GymControllerBase with _$GymController;

abstract class _GymControllerBase with Store {
  GymRepository _gymRepository = Modular.get();

  List<GymModel> gyms = [];

  @observable
  GymState gymState = GymState.LOADING;

  @action
  fetchGyms(GymModel filter) async {
    gymState = GymState.LOADING;
    gyms = [];
    gyms.addAll(await _gymRepository.findAllGyms(filter));

    if (gyms.length > 0)
      gymState = GymState.EMPTY;
    else
      gymState = GymState.MANY;
  }
}

enum GymState { EMPTY, LOADING, MANY }
