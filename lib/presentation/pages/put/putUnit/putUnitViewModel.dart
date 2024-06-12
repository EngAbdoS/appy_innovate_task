import 'dart:async';
import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/app/extentions.dart';
import 'package:appy_innovate/data/requests/unitRequest.dart';
import 'package:appy_innovate/domain/models/models.dart';
import 'package:appy_innovate/domain/repository/repository.dart';
import 'package:appy_innovate/presentation/pages/put/UnitBaseViewModel.dart';
import 'package:appy_innovate/presentation/widgets/errorState.dart';
import 'package:appy_innovate/presentation/widgets/loadingState.dart';
import 'package:appy_innovate/presentation/widgets/successState.dart';
import 'package:rxdart/rxdart.dart';

class PutUnitViewModel extends BaseUnitViewModel{

  final Repository _repo = instance<Repository>();

  putUnit(dynamic context) async {
    loadingState(context: context);
    //print(_repo.getInvoiceDetail());
    UnitRequest req = UnitRequest(
      id: unitModel.id,
      name: unitModel.name,
    );

    (await _repo.putUnit(req)).fold(
            (failure) => {
          errorState(context: context, message: failure.message),
          //TODO create error state
        }, (data) {
      successState(context: context);
    });
    print("add");
  }



}
