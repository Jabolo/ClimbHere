import 'gym_form/gym_form_controller.dart';
import 'gym_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'gym_form/gym_form_page.dart';
import 'gym_page.dart';

class GymModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => GymFormController()),
    Bind((i) => GymController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => GymPage()),
    ModularRouter('/form', child: (_, args) => GymFormPage(addedGym: args.data)),
  ];

  static Inject get to => Inject<GymModule>.of();
}
