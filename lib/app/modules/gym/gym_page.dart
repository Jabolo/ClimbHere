import 'package:climb_here_flutter/app/modules/shared/models/gym_model.dart';
import 'package:climb_here_flutter/app/modules/shared/models/wall_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';

import 'gym_controller.dart';

class GymPage extends StatefulWidget {
  final String gymName;

  const GymPage({Key key, this.gymName = "Gym"}) : super(key: key);

  @override
  _GymPageState createState() => _GymPageState();
}

class _GymPageState extends ModularState<GymPage, GymController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<FormBuilderState> _searchFormBuilderKey =
      new GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    controller.fetchGyms(GymModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Modular.to.pushNamed('/form');
          controller.fetchGyms(GymModel());
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'ClimbHERE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormBuilder(
                    onChanged: (_) {
                      controller.fetchGyms(GymModel.fromJson(
                          _searchFormBuilderKey.currentState.value));
                    },
                    key: _searchFormBuilderKey,
                    initialValue: {'gymName': null},
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: 'gymName',
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Observer(builder: (_) {
                  if (controller.gymState == GymState.LOADING) {
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          LinearProgressIndicator(),
                        ],
                      ),
                    );
                  } else if (controller.gymState == GymState.EMPTY) {
                    return RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () async {
                        _searchFormBuilderKey.currentState.reset();
                        await controller.fetchGyms(GymModel());
                      },
                      child: ListView.builder(
                          itemCount: controller.gyms.length,
                          itemBuilder: (_, i) =>
                              _buildGymTile(controller.gyms[i])),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGymTile(GymModel gymModel) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/form', arguments: gymModel);
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              Text(
                gymModel.gymName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gymModel.walls.length,
                    itemBuilder: (_, i) => _buildImage(gymModel.walls[i]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(WallModel wallModel) {
    return ClipRRect(
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: wallModel.wallImageURL,
        fit: BoxFit.cover,
        width: 120,
        height: 120,
      ),
    );
  }
}
