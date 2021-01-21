// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GymController on _GymControllerBase, Store {
  final _$gymStateAtom = Atom(name: '_GymControllerBase.gymState');

  @override
  GymState get gymState {
    _$gymStateAtom.reportRead();
    return super.gymState;
  }

  @override
  set gymState(GymState value) {
    _$gymStateAtom.reportWrite(value, super.gymState, () {
      super.gymState = value;
    });
  }

  final _$fetchGymsAsyncAction = AsyncAction('_GymControllerBase.fetchGyms');

  @override
  Future fetchGyms(GymModel filter) {
    return _$fetchGymsAsyncAction.run(() => super.fetchGyms(filter));
  }

  @override
  String toString() {
    return '''
gymState: ${gymState}
    ''';
  }
}
