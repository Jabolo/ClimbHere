import 'package:climb_here_flutter/app/modules/shared/models/gym_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'form_builder_image_field.dart';
import 'gym_form_controller.dart';

class GymFormPage extends StatefulWidget {
  final GymModel addedGym;

  const GymFormPage({Key key, this.addedGym}) : super(key: key);

  @override
  _GymFormPageState createState() => _GymFormPageState();
}

class _GymFormPageState extends ModularState<GymFormPage, GymFormController> {
  GymModel _val;
  Map<String, dynamic> _initVal;

  final GlobalKey<FormBuilderState> _gymFormBuilderKey =
      new GlobalKey<FormBuilderState>();

  @override
  void initState() {
    _val = widget.addedGym;
    controller.setSavedGym(_val); //!!!!!!!!!!!!!!!!!!!!!!#@$#@$RED#############2

    if (_val != null) {
      _initVal = {
        'gymID': _val.gymID,
        'gymName': _val.gymName,
        'walls': _val.walls.map((e) => e.wallImageURL).toList(),
      };
    } else {
      _initVal = {
        'gymID': null,
        'gymName': null,
        'walls': [],
      };
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Modular.to.pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'GYM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Observer(
                      builder: (_) => Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              child: Text("Save"),
                              onPressed:
                                   //$$$$$$$$$$$$$$$$$$$#@!#@!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$@!#@!!
                              controller.gymFormState == GymFormState.LOADING ? null : () {
                                if(_gymFormBuilderKey.currentState.saveAndValidate()){
                                  controller.saveGym(_gymFormBuilderKey.currentState.value);
                                }
                              }
                            ),
                          )),
                ))
              ],
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Observer(
                  builder: (_) => FormBuilder(
                    readOnly: controller.gymFormState == GymFormState.LOADING,
                    key: _gymFormBuilderKey,
                    initialValue: _initVal,
                    child: Column(
                      children: [
                        FormBuilderImageField(
                          attribute: 'walls',
                          validators: [
                                (images) {
                              if (images is List) {
                                if (images.isEmpty) {
                                  return 'Images are required.';
                                }
                              }
                              return null;
                            }
                          ],
                        ),
                      SizedBox(height: 25,),
                        FormBuilderTextField(
                          maxLines: 1,
                            attribute: 'gymName',)
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
