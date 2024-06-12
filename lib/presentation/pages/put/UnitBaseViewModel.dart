import 'dart:async';
import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/app/extentions.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';
import 'package:rxdart/rxdart.dart';

class BaseUnitViewModel {
  final StreamController _unitIdStreamController = BehaviorSubject<int>();
  final StreamController _unitNameStreamController = BehaviorSubject<String>();
  final StreamController _unitValidationStreamController =
  BehaviorSubject<bool?>();


  UnitModel unitModel = UnitModel(id: 0);

  Sink get unitIdStream => _unitIdStreamController.sink;

  Sink get unitNameStream => _unitNameStreamController.sink;

  Sink get unitValidationStream => _unitValidationStreamController.sink;

  Stream<bool> get outputIsUnitNameValid =>
      _unitNameStreamController.stream.map((name) => name.isNotEmpty);

  Stream<bool> get outputIsUnitIdValid =>
      _unitIdStreamController.stream.map((id) => (id != 0 && id != null));

  Stream<bool> get outputIsUnitValid =>
      _unitValidationStreamController.stream.map((data) => isUnitValid());

  setUnitId(String id) {
    unitModel.id = id.toInt();
    unitIdStream.add(id.toInt());
    unitValidationStream.add(null);
  }

  setUnitName(String name) {
    unitModel.name = name;
    unitNameStream.add(name);
    unitValidationStream.add(null);
  }

  bool isUnitValid() {
    return unitModel.id != 0 && unitModel.name != null;
  }


  //
  // addUnit(dynamic context) async {
  //   loadingState(context: context);
  //   //print(_repo.getInvoiceDetail());
  //   UnitRequest req = UnitRequest(
  //     id: unitModel.id,
  //     name: unitModel.name,
  //   );
  //
  //   (await _repo.postUnit(req)).fold(
  //           (failure) => {
  //         errorState(context: context, message: failure.message),
  //         //TODO create error state
  //       }, (data) {
  //     successState(context: context);
  //   });
  //   print("add");
  // }


  dispose() {
    _unitIdStreamController.close();
    _unitNameStreamController.close();
    _unitValidationStreamController.close();
  }
}
