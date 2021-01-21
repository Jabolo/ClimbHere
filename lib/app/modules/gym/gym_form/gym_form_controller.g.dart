// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GymFormController on _GymFormControllerBase, Store {
  final _$gymFormStateAtom = Atom(name: '_GymFormControllerBase.gymFormState');

  @override
  GymFormState get gymFormState {
    _$gymFormStateAtom.reportRead();
    return super.gymFormState;
  }

  @override
  set gymFormState(GymFormState value) {
    _$gymFormStateAtom.reportWrite(value, super.gymFormState, () {
      super.gymFormState = value;
    });
  }

  final _$saveGymAsyncAction = AsyncAction('_GymFormControllerBase.saveGym');

  @override
  Future saveGym(Map<String, dynamic> form) {
    return _$saveGymAsyncAction.run(() => super.saveGym(form));
  }

  @override
  String toString() {
    return '''
gymFormState: ${gymFormState}
    ''';
  }
}
