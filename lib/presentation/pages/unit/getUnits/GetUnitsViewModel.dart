import 'dart:async';

import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/repository/repository.dart';

class GetUnitsViewModel {
  final Repository _repo = instance<Repository>();
  final StreamController _unitsListStreamController = BehaviorSubject<List<UnitModel>>();


  Sink get unitsListSink => _unitsListStreamController.sink;


  Stream<List<UnitModel>> get outputUnitsList =>
      _unitsListStreamController.stream.map((list) => list);


  List<UnitModel> units = [];

  getUnits(dynamic context) async {
    loadingState(context: context);
    //print(_repo.getInvoiceDetail());

    (await _repo.getUnits()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
              //TODO create error state
            }, (data) {
      units = data;
      unitsListSink.add(units);
      print(units[0]);
      successState(context: context);
    });
    print("add");
  }
}
