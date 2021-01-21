import 'package:climb_here_flutter/app/app_widget.dart';
import 'package:climb_here_flutter/app/modules/shared/repository/gym_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'modules/gym/gym_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GymRepository(dio: i.get())),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: 'http://192.168.0.11:8088')))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: GymModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
